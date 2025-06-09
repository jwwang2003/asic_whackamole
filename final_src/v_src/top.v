`default_nettype none
`include "defines.vh"

module top (
    input  wire        clk,         
    input  wire        rstn,        

    input  wire        start_btn,   
    input  wire        mole1_btn,   
    input  wire        mole2_btn,   
    input  wire        mole3_btn,   
    input  wire        mole4_btn,   
    input  wire        mole5_btn,   
    input  wire        mole6_btn,   
    input  wire        mole7_btn,   
    input  wire        mole8_btn,   

    output wire        mole1_led,
    output wire        mole2_led,
    output wire        mole3_led,
    output wire        mole4_led,
    output wire        mole5_led,
    output wire        mole6_led,
    output wire        mole7_led,
    output wire        mole8_led,

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

    output wire        timer_A,
    output wire        timer_B,
    output wire        timer_C,
    output wire        timer_D,
    output wire        timer_E,
    output wire        timer_F,
    output wire        timer_G,

    output wire        lvl_A,
    output wire        lvl_B,
    output wire        lvl_C,
    output wire        lvl_D,
    output wire        lvl_E,
    output wire        lvl_F,
    output wire        lvl_G,

    output wire        mul_A,
    output wire        mul_B,
    output wire        mul_C,
    output wire        mul_D,
    output wire        mul_E,
    output wire        mul_F,
    output wire        mul_G,

    // game‐over indicator
    output wire        game_over_led,

    // 1-second hit pulse
    output wire        hit_led
);

    //--------------------------------------------------------------------------
    // Parameters / Constants
    //--------------------------------------------------------------------------
    parameter integer ROUND_INTERVAL_SEC = 6;

     localparam [2:0]
        IDLE       = 3'd0,
        REQ        = 3'd1,
        WAIT_MOLE  = 3'd2,
        WAIT_HIT   = 3'd3,
        LEVEL_DONE = 3'd4,
        GAME_OVER  = 3'd5;

    reg [2:0]  state, next_state;
    reg [3:0]  level;                      // starting at 1
    reg [3:0]  multiplier;                 // starting at 1
    reg [3:0]  time_interval;              // in seconds, starts at 6

    //--------------------------------------------------------------------------
    // Variables
    //--------------------------------------------------------------------------
    reg  [15:0] score_reg;

    // Internal active‐low reset
    wire rst_n_internal = rstn;

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

    //==========================================================================
    // LFSR PRNG
    //==========================================================================
    wire [7:0] rnd_out;
    lfsr_prng u_prng (
        .clk    (clk),
        .rst    (!rst_n_internal),
        .random (rnd_out)
    );

    //==========================================================================
    // Unique Selector
    //==========================================================================
    reg         us_req;
    wire [2:0]  us_selected_number;
    wire        us_done;
    wire        us_all_selected;

    wire rst_us = (!rst_n_internal) || (state == LEVEL_DONE) || (state == IDLE);

    unique_selector u_us (
        .clk             (clk),
        .rst             (rst_us),
        .rnd_num         (rnd_out[2:0]),
        .req             (us_req),
        .selected_number (us_selected_number),
        .done            (us_done),
        .all_selected    (us_all_selected)
    );

    //==========================================================================
    // Interval Counter + Restart‐on‐done logic
    //==========================================================================
    wire timer_enable = (state != IDLE) && (state != GAME_OVER);

    // reset the interval counter when selector is done OR when we shouldn't be timing
    wire rst_n_ic = rst_n_internal 
                   & timer_enable 
                   & ~us_done;

    wire [2:0] ic_count;
    wire       ic_timeout;
    interval_counter u_interval_cnt (
        .clk      (clk),
        .rst_n    (rst_n_ic),
        .interval (time_interval[2:0]),   
        .dir      (1'b0),                       
        .count    (ic_count),                  
        .timeout  (ic_timeout)                 
    );

    //==========================================================================
    // 1-Digit Timer Display
    //==========================================================================
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

    //--- Level display
    seven_seg u_level_disp (
        .hex  (level),
        .seg  ({ lvl_A, lvl_B, lvl_C, lvl_D, lvl_E, lvl_F, lvl_G })
    );

    //--- Multiplier display
    seven_seg u_mult_disp (
        .hex  (multiplier),
        .seg  ({ mul_A, mul_B, mul_C, mul_D, mul_E, mul_F, mul_G })
    );

    // High whenever state == GAME_OVER
    assign game_over_led = (state == GAME_OVER);

    //==========================================================================
    // 4-Digit Score Display
    //==========================================================================
    // Extend to 4-bit and drive seven_seg
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

    //==========================================================================
    // Mole pattern register
    //==========================================================================
    reg [7:0] mole_pattern;
    always @(posedge clk or negedge rst_n_internal) begin
        if (!rst_n_internal) begin
            mole_pattern <= 8'b0;
        end else if (state == GAME_OVER) begin
            // disable all LEDs when game is over
            mole_pattern <= 8'b0;
        end else if (us_done) begin
            // latch the new one-hot mole when a selection completes
            mole_pattern <= 8'b1 << us_selected_number;
        end
    end

    //------------------------------------------------------------------------
    // Hit LED: on as long as the correct mole button is pressed
    //------------------------------------------------------------------------
    // mole_btns_db is high when any button is held; 
    // mole_pattern is the one-hot “current mole” mask.
    wire correct_hit = |(mole_pattern & mole_btns_db);
    assign hit_led   = correct_hit;

    // Map to LEDs
    assign mole1_led = mole_pattern[0];
    assign mole2_led = mole_pattern[1];
    assign mole3_led = mole_pattern[2];
    assign mole4_led = mole_pattern[3];
    assign mole5_led = mole_pattern[4];
    assign mole6_led = mole_pattern[5];
    assign mole7_led = mole_pattern[6];
    assign mole8_led = mole_pattern[7];
    
    //--------------------------------------------------------------------------
    // FSM: state transitions
    //--------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n_internal) begin
        if (!rst_n_internal)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @* begin
        next_state = state;
        us_req      = 1'b0;

        case (state)
            //----------------------------------------
            IDLE: begin
                if (start_btn_release)
                    next_state = REQ;
            end

            //----------------------------------------
            REQ: begin
                // pressing Start mid-game aborts back to IDLE
                if (start_btn_release)
                    next_state = IDLE;
                else begin
                    us_req      = 1'b1;
                    next_state  = WAIT_MOLE;
                end
            end

            //----------------------------------------
            WAIT_MOLE: begin
                if (start_btn_release)
                    next_state = IDLE;
                else if (us_done)
                    next_state = WAIT_HIT;
            end

            //----------------------------------------
            WAIT_HIT: begin
                if (start_btn_release)
                    next_state = IDLE;
                else if (|mole_btns_release)
                    next_state = us_all_selected ? LEVEL_DONE : REQ;
                else if (ic_timeout)
                    next_state = us_all_selected ? LEVEL_DONE : REQ;
            end

            //----------------------------------------
            LEVEL_DONE: begin
                if (start_btn_release)
                    next_state = IDLE;
                else
                    next_state = (time_interval > 3'd2) ? REQ : GAME_OVER;
            end

            //----------------------------------------
            GAME_OVER: begin
                // stay here until Start is pressed -> go to IDLE
                if (start_btn_release)
                    next_state = IDLE;
                else
                    next_state = GAME_OVER;
            end
        endcase
    end

    //--------------------------------------------------------------------------
    // FSM: outputs and registers update
    //--------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n_internal) begin
        if (!rst_n_internal) begin
            // init values
            time_interval <= 4'd6;
            level         <= 4'd1;
            multiplier    <= 4'd1;
            score_reg     <= 16'd0;
        end else begin
            case (state)
                //----------------------------------------
                IDLE: begin
                    // re-initialize on every entry to IDLE
                    time_interval <= 4'd6;
                    level         <= 4'd1;
                    multiplier    <= 4'd1;
                    score_reg     <= 16'd0;
                end

                REQ: begin
                    // nothing: request made
                end

                WAIT_MOLE: begin
                    // nothing
                end

                //----------------------------------------
                WAIT_HIT: begin
                    if (|mole_btns_release && (mole_pattern & mole_btns_release))
                        score_reg <= score_reg + multiplier;
                end

                //----------------------------------------
                LEVEL_DONE: begin
                    if (time_interval > 3'd2) begin
                        level      <= level + 1;
                        multiplier <= multiplier + 1;
                        time_interval <= time_interval - 3'd2;
                    end else
                        time_interval <= 3'd0;
                end

                GAME_OVER: begin
                    // game over: values remain until reset or restart
                end
            endcase
        end
    end

endmodule




