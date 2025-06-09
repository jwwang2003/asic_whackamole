`default_nettype none

//==============================================================================
//  Button‐debounce module (synchronizer + shift‐register filter).
//  - parameter WIDTH controls the number of consecutive stable samples needed
//    before the output actually toggles.
//  - Active‐high logic: when the raw button input is stable high for WIDTH cycles,
//    the debounced output goes high; if stable low for WIDTH cycles, debounced output goes low.
//------------------------------------------------------------------------------

module btn_debounce #(
    parameter integer WIDTH = 16
) (
    input  wire clk,       // system clock
    input  wire rst_n,     // active‐high reset (logic 1 = not in reset; logic 0 = reset)
    input  wire button_in, // raw, possibly noisy button input (asynchronous)
    output reg  button_out // debounced, synchronous to clk
);

    // Two‐stage synchronizer for the raw button signal
    reg sync_ff1, sync_ff2;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sync_ff1 <= 1'b0;
            sync_ff2 <= 1'b0;
        end else begin
            sync_ff1 <= button_in;
            sync_ff2 <= sync_ff1;
        end
    end

    // Shift register for filtering out bounce
    reg [WIDTH-1:0] shift_reg;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            shift_reg  <= {WIDTH{1'b0}};
            button_out <= 1'b0;
        end else begin
            // Shift in synchronized button level each clock
            shift_reg <= { shift_reg[WIDTH-2:0], sync_ff2 };

            // Once the shift register is all ones → output goes high
            if (&shift_reg)
                button_out <= 1'b1;
            // Once the shift register is all zeros → output goes low
            else if (~|shift_reg)
                button_out <= 1'b0;
            // Otherwise, retain previous button_out
        end
    end

endmodule