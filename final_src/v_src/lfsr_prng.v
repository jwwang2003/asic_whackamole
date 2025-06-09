`default_nettype none

module lfsr_prng #(
    parameter [7:0] INIT_SEED = 8'hAB
)(
    input  wire       clk,          // Clock
    input  wire       rst,          // Sync reset
    output reg  [7:0] random        // 8-bit LFSR state/output
);

    // taps for an 8-bit maximal LFSR: x^8 + x^6 + x^5 + x^4 + 1
    wire feedback = random[7] ^ random[5] ^ random[4] ^ random[3];

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // choose which seed to load on reset
            random <= INIT_SEED;
        end else begin
            // shift left, inserting feedback bit at LSB
            random <= { random[6:0], feedback };
        end
    end

endmodule

