module top #(
    parameter CLOCK_FREQ         = 50_000,        // Master clock freq. (50KHz)

    // Default game parameters
    parameter INIT_INTERVAL_SEC  = 6,
    parameter DESC_INTERVAL_SEC  = 2,
    parameter NEXT_DELAY_SEC     = 5'd1,         // use fixed-point: 1/10 for 0.5s at 50MHz? adjust as needed
    parameter PTS_MULT           = 1,
)(
    input  wire        clk,
    input  wire        rst,
    input  wire        user_valid,
    input  wire [3:0]  user_number,
    output wire [3:0]  target_number,
    output wire [31:0] pts_counter,
    output wire        game_over
);
    
    // registers (default values)

    reg [31:0] pts_counter_reg;
    reg [31:0] interval_cycles;

    // constants in cycles
    localparam integer INIT_INTERVAL_CYCLES = INIT_INTERVAL_SEC * CLOCK_FREQ;
    localparam integer INTERVAL_DESC_CYCLES = INTERVAL_DESC_SEC * CLOCK_FREQ;
    localparam integer NEXT_DELAY_CYCLES    = (NEXT_DELAY_SEC * CLOCK_FREQ) / 10; // if NEXT_DELAY_SEC=5, means 0.5s

    // wires
    wire timer_timeout;
    wire timer_running;
    wire sub_time_flag;
    wire add_pt;
    wire next_rd;
    wire us_req;
    wire [3:0] us_num;
    wire us_sel;
    wire us_all;

    // PRNG
    wire [15:0] prng_random;
    lfsr_prng #(.WIDTH(16)) prng_inst (
        .clk(clk),
        .rst(rst),
        .use_ext_seed(1'b0),
        .seed_in(16'hACE1),
        .random(prng_random)
    );

    // unique selector
    unique_selector #(.n(4), .WIDTH(16)) sel_inst (
        .clk(clk),
        .rst(rst),
        .req(us_req),
        .rnd_num(prng_random),
        .selected_number(us_num),
        .selected(us_sel),
        .done(),
        .all_selected(us_all)
    );

    // timer: reload on start_timer, subtract on sub_time_flag
    wire start_timer;
    game_timer #(
        .CLOCK_FREQ(CLOCK_FREQ),
        .INIT_SEC(INIT_INTERVAL_SEC)
    ) timer_inst (
        .clk(clk),
        .rst(rst),
        .load(start_timer),
        .subtract2(sub_time_flag),
        .running(timer_running),
        .timeout(timer_timeout)
    );

    // game logic
    game_logic #(.DELAY_CYCLES(NEXT_DELAY_CYCLES)) logic_inst (
        .clk(clk),
        .rst(rst),
        .start_game(start_game),
        .us_req(us_req),
        .us_selected_number(us_num),
        .us_selected(us_sel),
        .us_all_selected(us_all),
        .timer_timeout(timer_timeout),
        .start_timer(start_timer),
        .user_valid(user_valid),
        .user_number(user_number),
        .target_number(target_number),
        .check_input(),
        .add_point(add_pt),
        .next_round(next_rd),
        .sub_time_flag(sub_time_flag)
    );

    // points counter
    always @(posedge clk or posedge rst) begin
        if (rst)
            pts_counter_reg <= 0;
        else if (add_pt)
            pts_counter_reg <= pts_counter_reg + PTS_MULT;
    end
    assign pts_counter = pts_counter_reg;

    // interval cycles counter
    always @(posedge clk or posedge rst) begin
        if (rst)
            interval_cycles <= INIT_INTERVAL_CYCLES;
        else if (sub_time_flag) begin
            if (interval_cycles > INTERVAL_DESC_CYCLES)
                interval_cycles <= interval_cycles - INTERVAL_DESC_CYCLES;
            else
                interval_cycles <= 0;
        end
    end

    // game over when interval reaches zero
    assign game_over = (interval_cycles == 0);
endmodule
