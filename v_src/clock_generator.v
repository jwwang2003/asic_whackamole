`default_nettype	none


module clock_generator #(
    parameter BASE_FREQ = 30_000_000, // Base clock frequency in Hz (default 30 MHz)
    parameter OUT_FREQ = 10_000_000   // Desired output clock frequency in Hz (default 10 MHz)
) (
    input wire clk_base,   // Base clock input
    input wire rst_n,      // Active-low reset
    output reg clk_out     // Output clock
);

    // Calculate the divisor based on the base and desired output frequency
    localparam DIVIDE_BY = BASE_FREQ / OUT_FREQ; // Calculate the division factor

    reg [31:0] count = 0; // Counter to divide the base clock

    // Clock generation logic
    always @(posedge clk_base or negedge rst_n) begin
        if (~rst_n) begin
            count <= 0;
            clk_out <= 0;  // Reset output clock
        end else begin
            if (count == DIVIDE_BY - 1) begin
                clk_out <= ~clk_out; // Toggle output clock
                count <= 0;  // Reset counter
            end else begin
                count <= count + 1; // Increment counter
            end
        end
    end

endmodule