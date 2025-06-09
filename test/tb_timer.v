`timescale 1ns/1ps


module tb_timer;
    // Simulation clock: toggle every 5ns (100MHz)
    reg clk = 0;
    always #5 clk = ~clk;

    // DUT signals
    reg rst;
    reg load;
    wire running;
    wire timeout;

    // Instantiate the simplified timer: INIT_SEC=2, CLOCK_FREQ=10 (10 ticks/sec)
    timer #(
        .CLOCK_FREQ(10),
        .INIT_SEC(2)
    ) uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .running(running),
        .timeout(timeout)
    );

    initial begin
        // 1) Assert reset
        rst = 1; load = 0;
        #20;
        if (running !== 0) $fatal(1, "After reset, running should be 0, got %b", running);
        if (timeout !== 0) $fatal(1, "After reset, timeout should be 0, got %b", timeout);

        // Release reset
        rst = 0;
        #20;

        // 2) Load the timer (2s -> 20 ticks)
        load = 1;
        #10 load = 0;

        // Immediately after load, running should go high on next clock
        @(posedge clk);
        if (running !== 1) $fatal(1, "Timer did not start after load: running=%b", running);
        if (timeout !== 0)  $fatal(1, "Timeout asserted too early: timeout=%b", timeout);
        $display("*** First timeout start time %0t ***", $time);

        // 3) Observe running high until timeout
        wait(timeout);

        // After timeout, running should be 0
        @(posedge clk);
        if (running !== 0)   $fatal(1, "Timer still running after timeout: running=%b", running);
        if (timeout !== 1)   $fatal(1, "Timeout failed to assert: timeout=%b", timeout);
        $display("*** First timeout at time %0t ***", $time);

        // 4) Reload and test again
        load = 1;
        #10 load = 0;
        @(posedge clk);
        if (running !== 1) $fatal(1, "Timer did not restart after reload: running=%b", running);
        $display("*** First timeout at time %0t ***", $time);

        // 5) Mid-count reset should clear timer
        #5;
        rst = 1;
        #10 rst = 0;
        @(posedge clk);
        if (running !== 0) $fatal(1, "Running should be 0 after mid-count reset, got %b", running);
        if (timeout !== 0) $fatal(1, "Timeout should be 0 after mid-count reset, got %b", timeout);

        // Reload again to verify
        load = 1;
        #10 load = 0;
        @(posedge clk);
        if (running !== 1) $fatal(1, "Timer did not restart after mid-count reload: running=%b", running);

        // Final timeout
        wait(timeout);
        @(posedge clk);
        if (running !== 0) $fatal(1, "Timer still running after second timeout: running=%b", running);
        if (timeout !== 1) $fatal(1, "Timeout failed to assert second time: timeout=%b", timeout);
        $display("*** Second timeout at time %0t ***", $time);

        $display("All assertions passed.");
        $finish;
    end
endmodule