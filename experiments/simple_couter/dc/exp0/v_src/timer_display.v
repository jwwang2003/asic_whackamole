// timer_display: top-level wiring seconds_counter → seven_seg
module timer_display #(
  parameter integer CLOCK_FREQ = 10_000
)(
  input  wire       clk,
  input  wire       rst_n,
  output wire [6:0] seg      // connect to your 7-segment display
);
  wire [3:0] sec_digit;

  // instantiate the 1 Hz seconds counter
  seconds_counter #(
    .CLOCK_FREQ(CLOCK_FREQ)
  ) u_counter (
    .clk      (clk),
    .rst_n    (rst_n),
    .sec_digit(sec_digit)
  );

  // instantiate the decoder to 7-segment
  seven_seg u_decoder (
    .digit(sec_digit),
    .seg  (seg)
  );
endmodule
