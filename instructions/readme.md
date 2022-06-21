This folder contains both the list of instruction, as well as an FPGA implementation on an iCE40HX8K-CT256.


# Instructions

## Layout

- Most Significant 8-bits reserved for instruction
- Least Significant 16-bits reserved for instruction arguments

## Instruction Groups

- Rra/Rrb: any readable register address
- Rwa/Rwb: any writable register address
- D16: 16-bit address
- D8: 8-bit address

### Miscellaneous Instructions

| Opcode | Assembly  | Arguments | Description            |
|--------|:---------:|:----------|:-----------------------|
| 0x00   |    NOP    |           | No operation           |
| 0x11   | IMMEDIATE | Rwa       | Load constant into Rwa |
| 0xFF   |    HLT    |           | No operation           |

### Transfer Instructions 0x20 - 0x3F

| Opcode | Assembly | Arguments | Description                                             |
|--------|:--------:|:----------|:--------------------------------------------------------|
| 0x20   |   PUSH   | Rra       | Write Rra to stack, decrement stack pointer             |
| 0x21   |   POP    | Rwa       | Copy value from stack into Rwa, increment stack pointer |
| 0x22   |   PEEK   | Rwa       | Copy value from stack into Rwa                          |
| 0x23   |   MOV    | Rra, Rwa  | Copy Rra to Rwa                                         |
| 0x24   |   MEMW   | D16       | Copy R0 to memory address D16                           |
| 0x25   |   MEML   | D16       | Copy memory address D16 to R0                           |

### Arithmetic Instructions 0x40 - 0x5F

- Arithmetic results are stored in ALU Register

| Opcode | Assembly | Arguments | Description                     |
|--------|:--------:|:----------|:--------------------------------|
| 0x40   |   ADD    | Rra, Rrb  | Add Rrb to Rra                  |
| 0x41   |   SUB    | Rra, Rrb  | Subtract Rrb from Rra           |
| 0x42   |   MUL    | Rra, Rrb  | Multiply Rra by Rrb             |
| 0x43   |    OR    | Rra, Rrb  | Logical OR between Rra and Rrb  |
| 0x44   |   AND    | Rra, Rrb  | Logical AND between Rra and Rrb |
| 0x45   |   XOR    | Rra, Rrb  | Logical XOR between Rra and Rrb |
| 0x46   |   NOT    | Rra       | Logical not on Rra              |
| 0x47   |   LSL    | Rra       | Logical left shift Rra by 1     |
| 0x48   |   LSR    | Rra       | Logical light shift Rra by 1    |

### Branch/Jump Instructions 0x60-0x7F

| Opcode | Assembly | Arguments | Description              |
|--------|:--------:|:----------|:-------------------------|
| 0x60   |   JMP    | D16       | Unconditional jump       |
| 0x61   |    JC    | D16       | Jump if carry bit is set |
| 0x62   |    JZ    | D16       | Jump if zero bit is set  |
| 0x63   |    JN    | D16       | Jump if negative         |

### CPU Flags

| Short |     Name      |
|-------|:-------------:|
| C     |  Carry Flag   |
| Z     |   Zero Flag   |
| N     | Negative Flag |
