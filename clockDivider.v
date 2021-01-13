// --------------------------------------------------------------------
// --------------------------------------------------------------------
// Module:clockDivider 
// 
// Author: george
// 
// Description: divide the clock
// 
// 
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Version: |Mod. Date:   |Changes Made:
// V1.0     |2021/01/11   |Initial ver
// --------------------------------------------------------------------
///////////////////////////
module clockDivider (clk, clk_out);
    input clk;
    output clk_out;

    parameter n = 1;

    reg [n-1:0] count; 
    wire [n-1:0] nextcount;

    always @(posedge clk) begin
        count <= nextcount;
    end

    assign nextcount = count + 1'b1;
    assign clk_out = count[n-1];
    
endmodule