function [63:0] process_misc;

input 	[4:0]	INSTR; 	// 5 Bit Instruction Select
input	[15:0]	ARGS; 	// 16 Bit Instruction Argument

begin
        case(INSTR)
                8'hFF':  process_misc <= 64'b0'; // HLT     
                8'h10':  process_misc <= 64'b0'; // TODO: Implement immediate();
                default: process_misc <= 64'b0'; // Undefined -> NOP
	endcase
end
endfunction
