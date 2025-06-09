`timescale 1ns / 1ps
`default_nettype none
`include "defines.vh"  // Include the defines file for constants

//==============================================================================
// Top‐Level for “whackamole” (with interval_counter replacing the old timer)
// and one‐shot release detection on every button.
//==============================================================================

module top (
    input  wire        clk,         // System clock (e.g. 50 MHz)
    input  wire        rstn,        // “rstn” button, active‐low

    input  wire        start_btn,   // “开始”  (raw, active‐high when pressed)
    input  wire        mole1_btn,   // “地鼠1”
    input  wire        mole2_btn,   // “地鼠2”
    input  wire        mole3_btn,   // “地鼠3”
    input  wire        mole4_btn,   // “地鼠4”
    input  wire        mole5_btn,   // “地鼠5”
    input  wire        mole6_btn,   // “地鼠6”
    input  wire        mole7_btn,   // “地鼠7”
    input  wire        mole8_btn,   // “地鼠8”

    // MOLE‐INDICATOR LEDs (one bit per mole)
    output wire        mole1_led,
    output wire        mole2_led,
    output wire        mole3_led,
    output wire        mole4_led,
    output wire        mole5_led,
    output wire        mole6_led,
    output wire        mole7_led,
    output wire        mole8_led,

    // FOUR‐DIGIT “SCORE” DISPLAY “分数” (BCD outputs)
    output wire        score_sel0,
    output wire        score_sel1,
    output wire        score_sel2,
    output wire        score_sel3,
    output wire        score_A,
    output wire        score_B,
    output wire        score_C,
    output wire        score_D,
    output wire        score_E,
    output wire        score_F,
    output wire        score_G,

    // SINGLE‐DIGIT “TIMER” DISPLAY “计时器” (0…9)
    output wire        timer_A,
    output wire        timer_B,
    output wire        timer_C,
    output wire        timer_D,
    output wire        timer_E,
    output wire        timer_F,
    output wire        timer_G
);

    //------------------------------------------------------------------------------
    //  Parameters / Constants
    //------------------------------------------------------------------------------

    reg [2:0] rount_interval;
    // Default round interval in seconds (0…7)
    parameter integer ROUND_INTERVAL_SEC = 6;

    // Score multiplier constant
    parameter integer SCORE_MULT = 1;

    wire [7:0] rnd_out;
    reg  [15:0] score_reg;
    wire        hit_event;  // user must drive this high for one clk cycle on a successful hit

    //------------------------------------------------------------------------------
    //  Internal reset signal (active‐high)
    //------------------------------------------------------------------------------
    // rstn is active‐low → invert for internal logic (active‐high reset)
    wire rst_n_internal = rstn;

    //------------------------------------------------------------------------------
    //  Button‐debounce instances for each raw input (WIDTH=16 samples)
    //------------------------------------------------------------------------------

    wire start_btn_db;
    wire mole1_btn_db, mole2_btn_db, mole3_btn_db, mole4_btn_db;
    wire mole5_btn_db, mole6_btn_db, mole7_btn_db, mole8_btn_db;

    btn_debounce #(.WIDTH(16)) db_start (
        .clk       (clk),
        .rst_n     (rst_n_internal),
        .button_in (start_btn),
        .button_out(start_btn_db)
    );

    btn_debounce #(.WIDTH(16)) db_mole1 (
        .clk       (clk),
        .rst_n     (rst_n_internal),
        .button_in (mole1_btn),
        .button_out(mole1_btn_db)
    );
    btn_debounce #(.WIDTH(16)) db_mole2 (
        .clk       (clk),
        .rst_n     (rst_n_internal),
        .button_in (mole2_btn),
        .button_out(mole2_btn_db)
    );
    btn_debounce #(.WIDTH(16)) db_mole3 (
        .clk       (clk),
        .rst_n     (rst_n_internal),
        .button_in (mole3_btn),
        .button_out(mole3_btn_db)
    );
    btn_debounce #(.WIDTH(16)) db_mole4 (
        .clk       (clk),
        .rst_n     (rst_n_internal),
        .button_in (mole4_btn),
        .button_out(mole4_btn_db)
    );
    btn_debounce #(.WIDTH(16)) db_mole5 (
        .clk       (clk),
        .rst_n     (rst_n_internal),
        .button_in (mole5_btn),
        .button_out(mole5_btn_db)
    );
    btn_debounce #(.WIDTH(16)) db_mole6 (
        .clk       (clk),
        .rst_n     (rst_n_internal),
        .button_in (mole6_btn),
        .button_out(mole6_btn_db)
    );
    btn_debounce #(.WIDTH(16)) db_mole7 (
        .clk       (clk),
        .rst_n     (rst_n_internal),
        .button_in (mole7_btn),
        .button_out(mole7_btn_db)
    );
    btn_debounce #(.WIDTH(16)) db_mole8 (
        .clk       (clk),
        .rst_n     (rst_n_internal),
        .button_in (mole8_btn),
        .button_out(mole8_btn_db)
    );

    // Combine into an 8‐bit one‐hot “mole_btns” vector (debounced levels):
    wire [7:0] mole_btns_db = {
        mole8_btn_db,
        mole7_btn_db,
        mole6_btn_db,
        mole5_btn_db,
        mole4_btn_db,
        mole3_btn_db,
        mole2_btn_db,
        mole1_btn_db
    };

    //--------------------------------------------------------------------------
    //  ONE‐PULSE (on release) GENERATOR FOR EACH BUTTON
    //
    //  We register the debounced signal, then detect when it goes from ‘1’→‘0’.
    //  That falling edge (pressed→released) becomes a single‐cycle pulse.
    //--------------------------------------------------------------------------

    // Start button one‐shot on release:
    reg start_btn_db_d;
    always @(posedge clk or negedge rst_n_internal) begin
        if (!rst_n_internal) begin
            start_btn_db_d <= 1'b0;
        end else begin
            start_btn_db_d <= start_btn_db;
        end
    end
    // One‐cycle pulse when debounced goes from 1→0:
    wire start_btn_release = (start_btn_db_d == 1'b1) && (start_btn_db == 1'b0);

    // Mole buttons one‐shot on release (falling edge detector on each bit):
    reg [7:0] mole_btns_db_d;
    always @(posedge clk or negedge rst_n_internal) begin
        if (!rst_n_internal) begin
            mole_btns_db_d <= 8'b0;
        end else begin
            mole_btns_db_d <= mole_btns_db;
        end
    end
    // One‐cycle pulse for each mole i when debounced goes from 1→0:
    wire [7:0] mole_btns_release;
    assign mole_btns_release = mole_btns_db_d & (~mole_btns_db);
    // (bitwise: if previous was 1 and now is 0, generate a "1" pulse.)

    
    //--------------------------------------------------------------------------
    //  Main
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        if (!rst_n_internal) begin
            // RESET to default game state
            
        end
    end

    //--------------------------------------------------------------------------
    //  Replace “round_cnt_reg / seconds_left” with interval_counter
    //--------------------------------------------------------------------------

    // interval_counter will count down from ROUND_INTERVAL_SEC (0…7) at 1 Hz,
    // assert timeout for one cycle when it reaches zero, and then stop.
    //
    //   .interval = how many seconds to count
    //   .dir      = 1 for up, 0 for down → we want a countdown
    //   .count    = the current 3‐bit count (0…7)
    //   .timeout  = one‐cycle pulse when terminal (zero) is hit

    wire [2:0] ic_count;
    wire       ic_timeout;

    interval_counter u_interval_cnt (
        .clk      (clk),
        .rst_n    (rst_n_internal),            // active‐low synchronous reset
        .interval (ROUND_INTERVAL_SEC[2:0]),   // 0…7
        .dir      (1'b0),                      // count down
        .count    (ic_count),                  // current count
        .timeout  (ic_timeout)                 // one‐cycle pulse at zero
    );

    // Pad the 3‐bit count from interval_counter up to 4 bits for the seven_seg
    wire [3:0] seconds_left = {1'b0, ic_count};

    seven_seg u_timer_disp (
        .hex (seconds_left),
        .seg ({ timer_A,
                timer_B,
                timer_C,
                timer_D,
                timer_E,
                timer_F,
                timer_G })
    );

    //--------------------------------------------------------------------------
    //  Mole pattern driver
    //--------------------------------------------------------------------------
    wire [7:0] mole_pattern;

    //--------------------------------------------------------------------------
    //  Map "mole_pattern" → LEDs
    //--------------------------------------------------------------------------
    assign mole1_led = mole_pattern[0];
    assign mole2_led = mole_pattern[1];
    assign mole3_led = mole_pattern[2];
    assign mole4_led = mole_pattern[3];
    assign mole5_led = mole_pattern[4];
    assign mole6_led = mole_pattern[5];
    assign mole7_led = mole_pattern[6];
    assign mole8_led = mole_pattern[7];

    //--------------------------------------------------------------------------
    //  FOUR‐DIGIT SCORE DISPLAY DRIVER (“分数”)
    //  Instantiate a 4‐digit BCD→7seg driver that takes score_reg[15:0].
    //--------------------------------------------------------------------------
    four_digit_seg u_score_disp (
        .clk      (clk),
        .value    (score_reg),
        .seg      ({ score_A,
                     score_B,
                     score_C,
                     score_D,
                     score_E,
                     score_F,
                     score_G }),
        .digit_en ({ score_sel3,
                     score_sel2,
                     score_sel1,
                     score_sel0 })
    );

    //========================================================================
    //  GAME OVER SIGNAL
    //========================================================================
    wire game_over;    // from FSM

    lfsr_prng u_prng (
        .clk    (clk),
        .rst    (!rst_n_internal),
        .random (rnd_out)
    );

    //========================================================================
    //  UNIQUE‐SELECTOR (RANDOM MOLE GENERATOR)
    //========================================================================
    reg         us_req;
    wire [2:0]  us_selected_number;
    wire        us_done;
    wire        us_all_selected;

    unique_selector u_us (
        .clk             (clk),
        .rst             (!rst_n_internal),
        .rnd_num         (rnd_out[2:0]),

        .req             (us_req),
        .selected_number (us_selected_number),
        .done            (us_done),
        .all_selected    (us_all_selected)
    );
endmodule
