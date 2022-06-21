`default_nettype none
`include "group/misc.v"
`include "group/transfer.v"
`include "group/arithmetic.v"
`include "group/branch.v"

module instruction_decoder(CLK, CBUS, OUT);

input		CLK;		// CPU Clock
input	[23:0]	CBUS;		// 24 Bit Instruction Bus

output 	[63:0]	OUT;

wire instruction;
wire arguments;

assign instruction = CBUS[23:16];
assign arguments = CBUS[15:0];

// On Each clock, try to decode instruction
always @ (posedge CLK) begin
	case(instruction[7:5])
		3'b001': OUT <= process_transfer(instruction, arguments);
		3'b010': OUT <= process_arithmetic(instruction, arguments);
		3'b011': OUT <= process_branch(instruction, arguments);
		default: OUT <= process_misc(instruction);
	endcase
end
endmodule
