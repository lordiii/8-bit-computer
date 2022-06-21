function process_misc;
	input 	[7:0]	INSTR; 	// 8 Bit Instruction Select
	input	[15:0]	ARGS; 	// 16 Bit Instruction Argument

	begin
        	case(INSTR)
                	8'hFF: process_misc = 1'b1; // HLT     
			8'h10: process_misc = 1'b1; // TODO: Implement immediate();
			default: process_misc = 1'b0; // Undefined -> NOP
		endcase
	end
endfunction
