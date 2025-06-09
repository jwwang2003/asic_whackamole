`default_nettype none

module unique_selector (
    input  wire        clk,             
    input  wire        rst,             
    input  wire        req,             
    input  wire [2:0]  rnd_num,         // Take only 3 LSBs → 0…7
    output reg  [2:0]  selected_number, 
    output reg         done,            
    output wire        all_selected      // now a wire, not reg
);

    // Track which of the 8 slots (0…7) have been used
    reg [7:0] selected_mask;

    // Internal state
    reg [2:0] potential_number;
    reg       searching;

    // Combinational: once all bits of selected_mask are 1, all_selected goes high
    assign all_selected = &selected_mask;

    // Main FSM (clocked)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            selected_mask   <= 8'd0;
            selected_number <= 3'd0;
            done            <= 1'b0;
            searching       <= 1'b0;
            // no need to initialize all_selected here (it's driven by selected_mask)
        end else begin
            if (req) begin
                searching <= 1'b1;
                done      <= 1'b0;
            end

            if (searching) begin
                // Grab a candidate 0–7
                potential_number <= rnd_num;

                // If not yet picked, accept it
                if (!selected_mask[potential_number]) begin
                    selected_mask[potential_number] <= 1'b1;
                    selected_number                 <= potential_number;
                    done                            <= 1'b1;
                    searching                       <= 1'b0;
                end else begin
                    done <= 1'b0;  // still searching next cycle
                end
            end else begin
                done <= 1'b0;
            end
        end
    end

endmodule


