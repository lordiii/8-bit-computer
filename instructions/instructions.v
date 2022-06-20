`default_nettype none

module instruction_decoder(CLK, CBUS);

reg	[3:0]	GRP;		// 4 Bit Instruction Group

input		CLK;		// CPU Clock
input	[23:0]	CBUS;		// 24 Bit Instruction Bus

wire instruction;
wire arguments;

assign instruction = CBUS[23:16];
assign arguments = CBUS[15:0];

always @ (posedge CLK) begin
end
endmodule