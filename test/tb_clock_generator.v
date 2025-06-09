`timescale 1ns/1ps

module tb_clock_generator();

    // Testbench signals
    reg clk_base;   // Base clock signal (30 MHz)
    reg rst_n;      // Active-low reset signal
    wire clk_out;   // Output clock (10 MHz)

    // Instantiate the clock_generator module
    // You can change the parameters here for different base and output frequencies
    clock_generator #(
        .BASE_FREQ(30_000_000),  // 30 MHz base clock
        .OUT_FREQ(10_000_000)    // 10 MHz output clock
    ) uut (
        .clk_base(clk_base),
        .rst_n(rst_n),
        .clk_out(clk_out)
    );

    // Base clock generation (30 MHz)
    always begin
        #16.67 clk_base = ~clk_base;  // Base clock period: 33.33 ns (30 MHz)
    end

    // Testbench initial block
    initial begin
        // Initialize signals
        clk_base = 0;
        rst_n = 0;

        // Set up the waveform dump file
        $dumpfile("sim.vcd");  // VCD file name
        $dumpvars(0, tb_clock_generator);    // Dump all signals in this testbench

        // Apply reset
        #33.33 rst_n = 1;  // Deassert reset after 10 ns

        // Wait for a few clock cycles
        #1000;

        // Monitor the generated clock output
        $display("Checking clock outputs...");
        $monitor("clk_out: %b", clk_out);
        
        // Run the simulation for a while
      #100000;

        $finish;  // Stop the simulation
    end

endmodule
