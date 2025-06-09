`default_nettype none

module unique_selector (
    input  wire        clk,             
    input  wire        rst,             
    input  wire        req,             
    input  wire [2:0]  rnd_num,         // Take only 3 LSBs → 0…7
    output reg  [2:0]  selected_number, 
    output reg         done,            
    output wire        all_selected      // now a wire
);

    // Track which of the 8 slots (0…7) have been used
    reg [7:0] selected_mask;

    // Internal state
    reg [2:0] potential_number;
    reg       searching;

    // all_selected is simply “1” whenever all bits of selected_mask are 1.
    assign all_selected = &selected_mask;

    // Main FSM (no need to drive all_selected here)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            selected_mask   <= 8'd0;
            selected_number <= 3'd0;
            done            <= 1'b0;
            // all_selected automatically becomes 0 when selected_mask=0
            searching       <= 1'b0;
        end else begin
            if (req) begin
                searching <= 1'b1;
                done      <= 1'b0;
            end

            if (searching) begin
                potential_number <= rnd_num;

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
