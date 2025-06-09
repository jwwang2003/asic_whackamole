module button_matrix_decoder #(
    parameter RWIDTH = 4,                             // one-hot row width
    parameter CWIDTH = 4                              // one-hot col width
)(
    input  wire [RWIDTH-1:0] row,                     // one-hot row input
    input  wire [CWIDTH-1:0] col,                     // one-hot col input
    output wire [$clog2(RWIDTH*CWIDTH)-1:0] data_out  // decimal index 0..(R*C-1)
);
    reg [$clog2(RWIDTH):0] row_idx = 0;
    reg [$clog2(CWIDTH):0] col_idx = 0;
    integer i;
    always @(*) begin
        row_idx = 0;
        col_idx = 0;
        for (i = 0; i < RWIDTH; i = i + 1)
            if (row[i]) row_idx = i + 1;
        for (i = 0; i < CWIDTH; i = i + 1)
            if (col[i]) col_idx = i + 1;
    end
    
    assign data_out = (row_idx != 0 && col_idx != 0) ? 
      (row_idx - 1) * RWIDTH + (col_idx - 1) : 
      {($clog2(RWIDTH*CWIDTH)){1'b0}};
endmodule
