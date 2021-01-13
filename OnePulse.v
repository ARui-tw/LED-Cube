// --------------------------------------------------------------------
// --------------------------------------------------------------------
// Module:OnePulse
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
///////////////////////////////sample code : onepulse
module OnePulse (
	output reg signal_single_pulse,
	input wire signal,
	input wire clock
	);
	
	reg signal_delay;

	always @(posedge clock) begin
		if (signal == 1'b1 & signal_delay == 1'b0)
		  signal_single_pulse <= 1'b1;
		else
		  signal_single_pulse <= 1'b0;

		signal_delay <= signal;
	end
endmodule
////////////////////////////////////////////////