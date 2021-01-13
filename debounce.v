// --------------------------------------------------------------------
// --------------------------------------------------------------------
// Module:debounce
// 
// Author: george
// 
// Description: 
// 
// 
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Version: |Mod. Date:   |Changes Made:
// V1.0     |2021/01/11   |Initial ver
// --------------------------------------------------------------------
//////////////////////////////sample code : debounce
module debounce (pb, clk, pb_debounce);
    input pb, clk;
    output pb_debounce;

    reg [3:0] DFF;

    always @(posedge clk) begin
        DFF[3:1] <= DFF[2:0];
        DFF[0] <= pb;
    end

assign pb_debounce = ((DFF == 4'b1111)? 1'b1 : 1'b0);
    
endmodule