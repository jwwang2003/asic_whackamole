`timescale 1ns/1ps

module tb_xor_shift_prng;

    // Testbench signals
    reg         clk;
    reg         rst;
    reg         use_ext_seed;
    reg [31:0]  seed_x;
    reg [31:0]  seed_y;
    reg [31:0]  seed_z;
    wire [31:0] random_out;

    // Instantiate the DUT
    xor_shift_prng #(
        .INIT_X(32'hDEADBEEF),
        .INIT_Y(32'hCAFEBABE),
        .INIT_Z(32'hFACEFEED)
    ) uut (
        .clk(clk),
        .rst(rst),
        .use_ext_seed(use_ext_seed),
        .seed_x(seed_x),
        .seed_y(seed_y),
        .seed_z(seed_z),
        .random(random_out)
    );

    // Clock generation (100 MHz)
    initial clk = 0;
    always #5 clk = ~clk;

    // Waveform dump setup
    initial begin
        $dumpfile("sim.vcd");
        $dumpvars(0, tb_xor_shift_prng);
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        use_ext_seed = 0;
        seed_x = 32'd0;
        seed_y = 32'd0;
        seed_z = 32'd0;

        // Hold reset for a few cycles
        #20 rst = 0;

        // Run PRNG with parameter seeds
        #100;

        // Test external seeding
        rst = 1;
        use_ext_seed = 1;
        seed_x = 32'h11111111;
        seed_y = 32'h22222222;
        seed_z = 32'h33333333;
        #20 rst = 0;

        // Run PRNG with external seeds
        #100;

        // Finish simulation
        $display("Simulation complete.");
        $finish;
    end

    // Monitor output to console
    initial begin
        $monitor("Time=%0t \t| use_ext_seed=%b \t| seed_x=%h seed_y=%h seed_z=%h \t| random=%h", 
                 $time, use_ext_seed, seed_x, seed_y, seed_z, random_out);
    end

endmodule
