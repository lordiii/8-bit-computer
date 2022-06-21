`default_nettype none
`include "group/misc.v"
`include "group/transfer.v"
//`include "group/arithmetic.v"
//`include "group/branch.v"

module instruction_decoder(CLK, CBUS, OUT);

reg		result;

input		CLK;		// CPU Clock
input	[23:0]	CBUS;		// 24 Bit Instruction Bus

output 		OUT;

wire instruction;
wire arguments;
wire group;

assign instruction = CBUS[23:16];
assign arguments = CBUS[15:0];
assign group = CBUS[23:21];

// On Each clock, try to decode instruction
always @ (posedge CLK) begin
	case(group)
		3'b001: OUT <= process_transfer(instruction, arguments);
		default: OUT <= process_misc(instruction, arguments);
	endcase
end
endmodule
