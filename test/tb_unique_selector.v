`timescale 1ns / 1ps

module tb_unique_selector;
    // Parameters
    parameter           WIDTH       = 8;
    parameter           n           = 3;        // 8 unique numbers (2^3 = 8)
    parameter           INIT_SEED   = 8'hAB;    // Seed for the PRNG

    // Testbench signals
    reg                 clk;
    reg                 rst;
    reg                 req;
    wire [WIDTH-1:0]    rnd_num;
    wire [n-1:0]        selected_number;
    wire                done;
    wire                all_selected;

    // Instantiate the external PRNG (LFSR)
    lfsr_prng #(
        .INIT_SEED(INIT_SEED)
    ) prng (
        .clk(clk),
        .rst(rst),
        .use_ext_seed(1'b0),
        .seed_in({WIDTH{1'b0}}),
        .random(rnd_num)
    );

    // Instantiate the DUT: unique_selector with external rnd_num
    unique_selector uut (
        .clk(clk),
        .rst(rst),
        .req(req),
        .rnd_num(rnd_num),
        .selected_number(selected_number),
        .done(done),
        .all_selected(all_selected)
    );

    // 10 kHz clock (100 µs period ⇒ 50 000 ns half‐period)
    always #50000 clk = ~clk;

    initial begin
        // Initialize
        clk = 0;
        rst = 0;
        req = 0;
        #20;
        
        // Assert reset
        rst = 1;
        #10;
        rst = 0;
        $display("[TEST] Starting unique selector test.");

        // Request 2^n unique numbers
        repeat (2**n) begin
            // Pulse req for one cycle
            @(posedge clk);
            req <= 1;
            @(posedge clk);
            req <= 0;

            // Wait for done
            wait (done);
            // Convert $time (ns) into 10 kHz ticks: divide by 100_000 ns
            $display(
              "Time %0d kHz\t| Selected Number = %0d\t| all_selected = %b",
              $time/100000,
              selected_number,
              all_selected
            );

            // small delay before next request
            #2;
        end

        // Final check
        if (all_selected) begin
            $display("all_selected = %b", all_selected);
            $display(
              ">> All %0d numbers have been selected successfully. (all_selected signal check passed)",
              2**n
            );
        end else begin
            $display(">> ERROR: not all numbers were selected.");
        end

        // Try one more request after full selection
        $display("[RESET] Performing reset.");
        @(posedge clk);
        rst <= 1;
        @(posedge clk);
        rst <= 0;
        $display("[TEST]: Get another RND number after reset.");
        @(posedge clk);
        req <= 1;
        @(posedge clk);
        req <= 0;
        wait (done);
        $display(
          "Time %0d kHz\t| Selected Number = %0d\t| all_selected = %b",
          $time/100000,
          selected_number,
          all_selected
        );

        $display("--- Test(s) Complete ---");
        $finish;
    end

endmodule
