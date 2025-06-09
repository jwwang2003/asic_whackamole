`default_nettype none

// ------------------------------------------------------------------
// top‐level display module: 
//   • Instantiates interval_counter (0…7 up/down counter with timeout pulse)  
//   • Instantiates your existing seven_seg decoder  
// ------------------------------------------------------------------
module timer_display #(
    parameter integer CLOCK_FREQ = 50_000   // your master clock, Hz
)(
    input  wire       clk,        // master clock
    input  wire       rst_n,      // active‐low synchronous reset
    input  wire [2:0] interval,   // how many seconds to count (0…7)
    input  wire       dir,        // 1 = count up, 0 = count down
    output wire [6:0] seg,        // 7-segment segments {a,b,c,d,e,f,g}
    output wire       timeout     // 1-cycle pulse on terminal count
);

  // hook up our new counter
  wire [2:0] count;
  interval_counter #(
    .CLOCK_FREQ(CLOCK_FREQ)
  ) u_interval (
    .clk      (clk),
    .rst_n    (rst_n),
    .interval (interval),
    .dir      (dir),
    .count    (count),
    .timeout  (timeout)
  );

  // decode that 3-bit count onto one 7-segment
  seven_seg u_sevenseg (
    .digit({1'b0, count}),
    .seg  (seg)
  );

endmodule

