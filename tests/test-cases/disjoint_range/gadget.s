disjoint_range:
   ldr x0, [x1, #0x28]              // Load secret (rdi + 0x28) into x0 (rax)
   ldr x1, [x2, #0x30]              // Load secret (rsi + 0x30) into x1 (rsi)

   // JE (if rax == 0xf) -> exit
   cmp x0, #0xf                     // Compare rax (x0) with 0xf
   beq exit                         // If equal (zero flag), branch to exit

   ldr x2, [x0]                     // Load value from [rax] into rcx (x2)

   movz x10, 0xffff, lsl #48
   movk x10, 0xffff, lsl #32
   movk x10, 0x8100, lsl #16
   movk x10, 0x0
   ldr x3, [x0, x10] // Load value from [rax + 0xffffffff81000000] into r8 (x3)
   cmp x1, #0xff                    // Compare rsi (x1) with 0xff
   beq exit                         // If equal (zero flag), branch to exit

   ldr x4, [x1, x0]                 // Load value from [rsi + rax] into r9 (x4)

   // JG (if rax > 0xf) -> exit
   cmp x0, #0xf                     // Compare rax (x0) with 0xf
   bgt exit                         // If greater, branch to exit

   ldr x5, [x0]                     // Load value from [rax] into rdx (x5)

   mov x11, 0xffff
   cmp x1, x11                  // Compare rsi (x1) with 0xffff
   bgt exit                         // If greater, branch to exit

   ldr x6, [x1]                     // Load value from [rsi] into rdx (x6)

   ldr x7, [x1, x10] // Load value from [rsi + 0xffffffff81000000] into rbx (x7)

   b exit                           // Branch to exit

exit:
   b 0xdead0                         // Jump to the exit address 0xdead0
