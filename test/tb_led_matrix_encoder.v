// Testbench for encoder
module tb_led_matrix_encoder;
    // parameters
    localparam RWIDTH = 4;
    localparam CWIDTH = 4;
    localparam N      = RWIDTH * CWIDTH;

    // testbench signals
    reg [RWIDTH-1:0] row;
    reg [CWIDTH-1:0] col;
    reg [$clog2(N)-1:0] data_idx;
    wire led_out;

    integer i, j;

    // instantiate encoder
    led_matrix_encoder #(
        .RWIDTH(RWIDTH),
        .CWIDTH(CWIDTH)
    ) dut (
        .row(row),
        .col(col),
        .data_idx(data_idx),
        .led_out(led_out)
    );

    initial begin
        $display("Time | row  col  idx | led_out");
        $display("--------------------------------");
        // test matching cases
        for (i = 0; i < RWIDTH; i = i + 1) begin
            for (j = 0; j < CWIDTH; j = j + 1) begin
                row      = 1 << i;
                col      = 1 << j;
                data_idx = i * CWIDTH + j;
                #10;
                $display("%0t | %b %b %2d | %b", $time, row, col, data_idx, led_out);
            end
        end
        // test non-matching case
        row      = 4'b0010;
        col      = 4'b0001;
        data_idx = 4'd15; // mismatch
        #10;
        $display("%0t | %b %b %2d | %b (expected 0)", $time, row, col, data_idx, led_out);

        $finish;
    end
endmodule