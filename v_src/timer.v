`default_nettype none


module timer #(
    parameter CLOCK_FREQ  = 30_000_000,   // clock frequency in Hz (30MHz)
    parameter INIT_SEC    = 6             // initial countdown seconds
)(
    input  wire clk,
    input  wire rst,
    input  wire load,                     // reload to INIT_SEC
    output reg  running,                  // high while timer > 0
    output wire timeout                   // high when count == 0
);
    // convert seconds to clock ticks
    localparam integer INIT_COUNT = INIT_SEC * CLOCK_FREQ;

    reg [31:0] count;

    assign timeout = (count == 0);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count   <= INIT_COUNT;
            running <= 0;
        end
        else if (load) begin
            count   <= INIT_COUNT;
            running <= 1;
        end
        else if (running) begin
            if (count > 0)
                count <= count - 1;
            if (count == 1)
                running <= 0;
        end
    end
endmodule
