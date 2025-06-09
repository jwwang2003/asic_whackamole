// seconds_counter: increments a 4-bit counter once per second (modulo 10)
module seconds_counter #(
  parameter integer CLOCK_FREQ = 10_000  // master clock frequency in Hz
)(
  input  wire       clk,
  input  wire       rst_n,
  output reg [3:0]  sec_digit
);
  // width of divider to count up to CLOCK_FREQ-1
  localparam integer DIV_WIDTH = $clog2(CLOCK_FREQ);

  reg [DIV_WIDTH-1:0] clk_div;

  // Divide master clock down to a 1 Hz “tick”
  always @(posedge clk) begin
    if (!rst_n) begin
      clk_div    <= {DIV_WIDTH{1'b0}};
    end else if (clk_div == CLOCK_FREQ-1) begin
      clk_div    <= {DIV_WIDTH{1'b0}};
    end else begin
      clk_div    <= clk_div + 1;
    end
  end

  // On each 1 Hz tick, increment the decimal seconds digit (0–9)
  wire one_hz = (clk_div == CLOCK_FREQ-1);
  always @(posedge clk) begin
    if (!rst_n) begin
      sec_digit <= 4'd0;
    end else if (one_hz) begin
      if (sec_digit == 4'd9)
        sec_digit <= 4'd0;
      else
        sec_digit <= sec_digit + 1;
    end
  end
endmodule
