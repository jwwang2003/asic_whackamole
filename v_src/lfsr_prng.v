`default_nettype none


module lfsr_prng #(
    // default 8-bit seed (can be overridden)
    parameter [7:0] INIT_SEED = 8'hA5
)(
    input  wire       clk,          // Clock
    input  wire       rst,          // Sync reset
    input  wire       use_ext_seed, // 1 = load seed_in, 0 = load INIT_SEED
    input  wire [7:0] seed_in,      // external seed input
    output reg  [7:0] random        // 8-bit LFSR state/output
);

    // taps for an 8-bit maximal LFSR: x^8 + x^6 + x^5 + x^4 + 1
    wire feedback = random[7] ^ random[5] ^ random[4] ^ random[3];

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // choose which seed to load on reset
            if (use_ext_seed)
                random <= seed_in;
            else
                random <= INIT_SEED;
        end else begin
            // shift left, inserting feedback bit at LSB
            random <= { random[6:0], feedback };
        end
    end

endmodule

`default_nettype wire
