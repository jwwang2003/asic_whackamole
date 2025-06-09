`timescale 1ns/1ps

module tb_afifo();

    // Parameter definitions
    parameter DSIZE = 8, ASIZE = 2;     // 2^2 = 4 (4 entries)
    parameter DW = DSIZE, AW = ASIZE;

    // Inputs to the afifo module
    reg i_wclk;
    reg i_wrst_n;
    reg i_wr;
    reg [DW-1:0] i_wdata;
    
    reg i_rclk;
    reg i_rrst_n;
    reg i_rd;

    // Outputs from the afifo module
    wire o_wfull;
    wire [DW-1:0] o_rdata;
    wire o_rempty;

    // Instantiate the afifo module
    afifo #(
        .DSIZE(DSIZE),
        .ASIZE(ASIZE)
    ) uut (
      // WRITE
        .i_wclk     (i_wclk),
        .i_wrst_n   (i_wrst_n),
        .i_wr       (i_wr),
        .i_wdata    (i_wdata),
        .o_wfull    (o_wfull),
      // READ
        .i_rclk     (i_rclk),
        .i_rrst_n   (i_rrst_n),
        .i_rd       (i_rd),
        .o_rdata(   o_rdata),
        .o_rempty   (o_rempty)
    );

    // Clock generation
    always begin
        #5 i_wclk = ~i_wclk; // Write clock period: 10 ns
        #5 i_rclk = ~i_rclk; // Read clock period: 10 ns
    end

    // Initial block to initialize signals and apply test cases
    initial begin
        // Initialize clocks and reset signals
        i_wclk = 0;
        i_rclk = 0;
        i_wrst_n = 0;
        i_rrst_n = 0;
        i_wr = 0;
        i_rd = 0;
        i_wdata = 0;

        // Apply reset
        #10;
        i_wrst_n = 1;
        i_rrst_n = 1;
        i_wr = 1;
        // Wait for some time before starting the test
        #20;
        
        // Test: Write data into FIFO
        i_wdata = 8'hAA; // Write 0xAA to FIFO
        #20;
        i_wdata = 8'hBB; // Write 0xBB to FIFO
        #20;
        i_wdata = 8'hCC; // Write 0xCC to FIFO
        #20;
        i_wdata = 8'h00;
        i_wr = 0;

        $display("Wrote 4 items into AFIFO");
        $display("FIFO Full: %b", o_wfull);
        $display("FIFO Empty: %b", o_rempty); // Expect o_rempty = 1 (FIFO is empty)
        
        // Test: Read data from FIFO
        #20;
        i_rd = 1; // Read data from FIFO
        #10;
        $display("Read data: %h", o_rdata); // Expect 0xAA
        #10; 
        i_rd = 1; // Continue reading
        #10; 
        $display("Read data: %h", o_rdata); // Expect 0xBB
        #10; 
        i_rd = 1; // Continue reading
        #10; 
        $display("Read data: %h", o_rdata); // Expect 0xCC
        #10;
        i_rd = 0;

        // Test: Check if FIFO becomes empty
        #10;
        $display("FIFO Empty: %b", o_rempty); // Expect o_rempty = 1 (FIFO is empty)

        // Test: Write data until FIFO is full

        // Continue writing until full (based on the ASIZE)
        // The exact number of writes will depend on the ASIZE parameter.

        i_wr = 1;
        i_rd = 0;
        i_wdata = 8'hDD; // Write 0xDD to FIFO
        #80;
        $display("Just wrote 4 items to the AFIFO");
        i_wr = 0;
        // Just wrote 4 items to the AFIFO

        // Test: Check if FIFO becomes full
        #10;
        $display("FIFO Full: %b", o_wfull); // Expect o_wfull = 1 (FIFO is full)

        // Test: Read data from FIFO
        #20;
        i_rd = 1; // Read data from FIFO
        #10;
        $display("Read data: %h", o_rdata); // Expect 0xAA
        $display("FIFO Full: %b", o_wfull);
        #10; 
        i_rd = 1; // Continue reading
        #10; 
        $display("Read data: %h", o_rdata); // Expect 0xBB
        $display("FIFO Full: %b", o_wfull);
        #10; 
        i_rd = 1; // Continue reading
        #10; 
        $display("Read data: %h", o_rdata); // Expect 0xCC
        $display("FIFO Full: %b", o_wfull);
        #10;
        i_rd = 1; // Continue reading
        #10; 
        $display("Read data: %h", o_rdata); // Expect 0xCC
        $display("FIFO Full: %b", o_wfull);
        #10;
        i_rd = 0;

        // Test: Try to write to full FIFO
        i_wdata = 8'hFF; // Attempt to write 0xFF to FIFO
        #10;
        $display("FIFO Full: %b", o_wfull); // Expect o_wfull = 1, no write should happen
        i_wr = 0;
        
        // Test: Reset FIFO and re-test
        i_wrst_n = 0; i_rrst_n = 0; // Assert reset
        #100;
        i_wrst_n = 1; i_rrst_n = 1; // Deassert reset
        #10;
        
        // Test reading from an empty FIFO
        i_rd = 1; // Read from FIFO
        #40;
        $display("Read from empty FIFO: %h", o_rdata); // Expect some undefined value or 0

        // End simulation
        $finish;
    end

endmodule
