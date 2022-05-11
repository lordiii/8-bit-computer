## Layout

- Most Significant 8-bits reserved for instruction
- Least Significant 16-bits reserved for instruction arguments

# Instructions

- Rra/Rrb: any readable register address
- Rwa/Rwb: any writable register address
- RAdr: 16-bit ROM address
- MAdr: 8-bit memory address

## Miscellaneous

| Opcode | Assembly | Arguments | Description  |
|--------|:--------:|:----------|:-------------|
| 0x00   |   NOP    |           | No operation |
| 0xFF   |   HLT    |           | No operation |

## Transfer

| Opcode | Assembly | Arguments | Description                                             |
|--------|:--------:|:----------|:--------------------------------------------------------|
| 0x01   |   PUSH   | Rra       | Write Rra to stack, decrement stack pointer             |
| 0x02   |   POP    | Rwa       | Copy value from stack into Rwa, increment stack pointer |
| 0x03   |   PEEK   | Rwa       | Copy value from stack into Rwa                          |
| 0x04   |   MOV    | Rra, Rwa  | Copy Rra to Rwa                                         |
| 0x05   |   MEMW   | Rra, MAdr | Copy Rra to memory address Ah                           |
| 0x05   |   MEML   | Rwa, MAdr | Copy memory address Ah to Rwa                           |

## Arithmetic

- Arithmetic results are stored in ALU Register

| Opcode | Assembly | Arguments | Description                     |
|--------|:--------:|:----------|:--------------------------------|
| 0xF0   |   ADD    | Rra, Rrb  | Add Rrb to Rra                  |
| 0xF1   |   SUB    | Rra, Rrb  | Subtract Rrb from Rra           |
| 0xF2   |   MUL    | Rra, Rrb  | Multiply Rra by Rrb             |
| 0xF3   |    OR    | Rra, Rrb  | Logical OR between Rra and Rrb  |
| 0xF4   |   AND    | Rra, Rrb  | Logical AND between Rra and Rrb |
| 0xF5   |   XOR    | Rra, Rrb  | Logical XOR between Rra and Rrb |
| 0xF6   |   XOR    | Rra       | Logical not on Rra              |
| 0xF7   |   LSL    | Rra       | Logical left shift Rra by 1     |
| 0xF8   |   LSR    | Rra       | Logical light shift Rra by 1    |

## Branch/Jump

- Arithmetic results are stored in ALU Register

| Opcode | Assembly | Arguments | Description              |
|--------|:--------:|:----------|:-------------------------|
| 0x80   |   JMP    | RAdr      | Unconditional jump       |
| 0x81   |    JC    | RAdr      | Jump if carry bit is set |
| 0x82   |    JZ    | RAdr      | Jump if zero bit is set  |
| 0x82   |    JN    | RAdr      | Jump if negative         |

## CPU Flags

| Short |     Name      |
|-------|:-------------:|
| C     |  Carry Flag   |
| Z     |   Zero Flag   |
| N     | Negative Flag |
