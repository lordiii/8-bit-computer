## Layout

- Most Significant 8-bits reserved for instruction
- Least Significant 16-bits reserved for instruction arguments

# Instructions

- Rra/Rrb: any readable register address
- Rwa/Rwb: any writable register address
- D16: 16-bit address
- D8: 8-bit address

## Miscellaneous 0x00 - 0x0F

| Opcode | Assembly  | Arguments | Description            |
|--------|:---------:|:----------|:-----------------------|
| 0x00   |    NOP    |           | No operation           |
| 0x01   | IMMEDIATE | Rwa       | Load constant into Rwa |
| 0xFF   |    HLT    |           | No operation           |

## Transfer 0x10 - 0x1F

| Opcode | Assembly | Arguments | Description                                             |
|--------|:--------:|:----------|:--------------------------------------------------------|
| 0x11   |   PUSH   | Rra       | Write Rra to stack, decrement stack pointer             |
| 0x12   |   POP    | Rwa       | Copy value from stack into Rwa, increment stack pointer |
| 0x13   |   PEEK   | Rwa       | Copy value from stack into Rwa                          |
| 0x14   |   MOV    | Rra, Rwa  | Copy Rra to Rwa                                         |
| 0x15   |   MEMW   | Rra, D8   | Copy Rra to memory address Ah                           |
| 0x16   |   MEML   | Rwa, D8   | Copy memory address Ah to Rwa                           |

## Arithmetic 0x20 - 0x2F

- Arithmetic results are stored in ALU Register

| Opcode | Assembly | Arguments | Description                     |
|--------|:--------:|:----------|:--------------------------------|
| 0x20   |   ADD    | Rra, Rrb  | Add Rrb to Rra                  |
| 0x21   |   SUB    | Rra, Rrb  | Subtract Rrb from Rra           |
| 0x22   |   MUL    | Rra, Rrb  | Multiply Rra by Rrb             |
| 0x23   |    OR    | Rra, Rrb  | Logical OR between Rra and Rrb  |
| 0x24   |   AND    | Rra, Rrb  | Logical AND between Rra and Rrb |
| 0x25   |   XOR    | Rra, Rrb  | Logical XOR between Rra and Rrb |
| 0x26   |   XOR    | Rra       | Logical not on Rra              |
| 0x27   |   LSL    | Rra       | Logical left shift Rra by 1     |
| 0x28   |   LSR    | Rra       | Logical light shift Rra by 1    |

## Branch/Jump 0x30-0x3F

- Arithmetic results are stored in ALU Register

| Opcode | Assembly | Arguments | Description              |
|--------|:--------:|:----------|:-------------------------|
| 0x30   |   JMP    | D16      | Unconditional jump       |
| 0x31   |    JC    | D16      | Jump if carry bit is set |
| 0x32   |    JZ    | D16      | Jump if zero bit is set  |
| 0x32   |    JN    | D16      | Jump if negative         |

## CPU Flags

| Short |     Name      |
|-------|:-------------:|
| C     |  Carry Flag   |
| Z     |   Zero Flag   |
| N     | Negative Flag |
