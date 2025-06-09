// encoder: maps a decimal LED index (0..N-1) to the matrix output based on row/col
module led_matrix_encoder #(
    parameter RWIDTH = 4,    // number of row bits (one-hot width)
    parameter CWIDTH = 4     // number of col bits (one-hot width)
)(
    input  wire [RWIDTH-1:0] row,              // one-hot row input
    input  wire [CWIDTH-1:0] col,              // one-hot col input
    input  wire [$clog2(RWIDTH*CWIDTH)-1:0] data_idx, // decimal index 0..(R*C-1)
    output wire             led_out           // LED on/off
);
    // decode one-hot to index
    reg [$clog2(RWIDTH)-1:0] row_idx;
    reg [$clog2(CWIDTH)-1:0] col_idx;
    integer i;
    always @(*) begin
        row_idx = 0;
        col_idx = 0;
        for (i = 0; i < RWIDTH; i = i + 1)
            if (row[i]) row_idx = i;
        for (i = 0; i < CWIDTH; i = i + 1)
            if (col[i]) col_idx = i;
    end

    // compute address and compare against data_idx
    localparam integer NCOLS = (1 << CWIDTH);
    wire [$clog2(RWIDTH*CWIDTH)-1:0] addr = row_idx * NCOLS + col_idx;
    assign led_out = (addr == data_idx);
endmodule