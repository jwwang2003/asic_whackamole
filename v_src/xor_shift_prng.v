module xor_shift_prng #(
    // default seeds if you don’t drive seed_* externally
    parameter [31:0] INIT_X = 32'h12345678,
    parameter [31:0] INIT_Y = 32'h23456789,
    parameter [31:0] INIT_Z = 32'h34567890
)(
    input  wire        clk,          // clock
    input  wire        rst,          // sync reset
    input  wire        use_ext_seed, // 1 = load external seeds, 0 = use INIT_*
    input  wire [31:0] seed_x,       // external seed for x
    input  wire [31:0] seed_y,       // external seed for y
    input  wire [31:0] seed_z,       // external seed for z
    output wire [31:0] random        // output random number
);

    // state regs
    reg [31:0] x, y, z;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            if (use_ext_seed) begin
                x <= seed_x;
                y <= seed_y;
                z <= seed_z;
            end else begin
                x <= INIT_X;
                y <= INIT_Y;
                z <= INIT_Z;
            end
        end else begin
            // XOR-Shift update
            x <= y;
            y <= z;
            z <= (z ^ (z >> 21)) ^ (x ^ (x << 35)) ^ (y ^ (y >> 4));
        end
    end

    assign random = z;

endmodule
