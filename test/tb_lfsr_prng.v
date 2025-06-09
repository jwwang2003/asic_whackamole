`timescale 1ns/1ps

module tb_lfsr_prng;

    // Testbench signals
    reg clk;
    reg rst;
    wire [15:0] random;

    // Instantiate the LFSR PRNG module
    // lfsr_prng uut (
    //     .clk(clk),
    //     .rst(rst),
    //     .use_ext_seed(1'b0),
    //     .random(random)
    // );
    lfsr_prng #(.INIT_SEED(16'hACE1)) uut (
        .clk(clk),
        .rst(rst),
        .use_ext_seed(1'b0),
        .random(random)
    );

    // Generate clock signal
    always begin
        #5 clk = ~clk; // Toggle clock every 5ns
    end

    // Stimulus for the simulation
    initial begin
        // ——— Waveform dump setup ———
        $dumpfile("sim.vcd");    // Name of the VCD file
        $dumpvars(0, tb_lfsr_prng);       // Dump all signals in this module
        // ——————————————————————————

        // Initialize signals
        clk = 0;
        rst = 0;

        // Apply reset
        rst = 1;
        #10;  // Hold reset for 10ns
        rst = 0;

        // Run simulation for some cycles
        #100;

        // End simulation
        $finish;
    end

    // Monitor the outputs
    initial begin
        $monitor("At time %t, random = %h", $time, random);
    end

endmodule
