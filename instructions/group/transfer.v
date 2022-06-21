function [63:0] process_transfer;

input 	[7:0]	INSTR; 	// 5 Bit Instruction Select
input	[15:0]	ARGS; 	// 16 Bit Instruction Argument

begin
	process_transfer = ~INSTR[0];
end
endfunction
