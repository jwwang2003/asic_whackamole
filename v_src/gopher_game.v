module game_logic #(
    parameter DELAY_CYCLES = 50       // small delay between rounds,

)(
    input  wire        clk,
    input  wire        rst,
    input  wire        start_game,    // start trigger

    

    // unique_selector interface (simple: us)
    output reg         us_req,
    input  wire [3:0]  us_selected_number,
    input  wire        us_done,
    input  wire        us_all_selected,

    // user input
    input  wire        user_valid,
    input  wire [3:0]  user_number,
    // outputs to top module
    output reg  [3:0]  target_number,
    output reg         start_timer,
    output reg         check_input,
    output reg         add_point,
    output reg         next_round,
    output reg         sub_time_flag
);
  // Defines the valid FSM states
  typedef enum reg [2:0] {
        IDLE,         // game has not start yet
        LOAD_GOPHER,  // wait for done signal from 'us'
        WAIT_INPUT,   // wait for user input OR timeout
        CHECK_INPUT,  // if user made input, check input
        WAIT_DELAY,   // wait for a small delay for proceeding to next gopher
        ROUND_COMPLETE  // if all_selected, decrease interval, increase points multiplier
    } state_t;
    state_t state, next_state;

  // Combinational logic
  always @(*) begin
        us_req=0;
        target_number=0;
        start_timer=0;
        check_input=0;
        add_point=0;
        next_round=0;
        sub_time_flag=0;
        next_state = state;

        case(state)
            IDLE: if(start_game) next_state=LOAD_RANDOM;
            LOAD_GOPHER: begin
              us_req=1; 
              if(us_selected) begin 
                target_number=us_selected_number; 
                start_timer=1; 
                next_state=WAIT_INPUT; 
              end 
            end
            WAIT_INPUT: 
              if(user_valid||timer_timeout) 
                next_state=CHECK_INPUT;
            CHECK_INPUT: begin
              check_input=1; 
              if(user_valid&&user_number==us_selected_number) add_point=1;
              next_round=1;
              if(us_all_selected)
                next_state=ROUND_COMPLETE;
              else 
                next_state=WAIT_DELAY;
            end
            WAIT_DELAY:
              if(delay_cnt>=DELAY_CYCLES)
                next_state=LOAD_RANDOM;
            ROUND_COMPLETE: begin
              sub_time_flag=1;
              add_point=1;
              next_round=1;
              next_state=IDLE;
            end
        endcase
    end

endmodule