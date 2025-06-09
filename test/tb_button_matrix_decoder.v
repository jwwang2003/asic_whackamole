// Testbench for button_matrix_decoder
module tb_button_matrix_decoder;
    localparam RWIDTH=4, CWIDTH=4, N=RWIDTH*CWIDTH;
    reg [RWIDTH-1:0] row;
    reg [CWIDTH-1:0] col;
    wire [$clog2(RWIDTH*CWIDTH)-1:0] data_out;
    integer i,j;
    button_matrix_decoder #(.RWIDTH(RWIDTH),.CWIDTH(CWIDTH)) uut(
        .row(row),
        .col(col),
        .data_out(data_out)
    );
    initial begin
        $display("Time \t| row col => data");
        $display("-------------------");
        for(i=0;i<RWIDTH;i=i+1) begin
            for(j=0;j<CWIDTH;j=j+1) begin
                row = 1<<i;
                col = 1<<j;
                #10;
                $display("%0t \t| %b %b => %0d", $time, row, col, data_out);
            end
        end
        // invalid cases
        row=4'b0000; col=4'b0001; #10; $display("%0t \t| %b %b => %0d (row zero)", $time, row, col, data_out);
        row=4'b0010; col=4'b0000; #10; $display("%0t \t| %b %b => %0d (col zero)", $time, row, col, data_out);
        $finish;
    end
endmodule