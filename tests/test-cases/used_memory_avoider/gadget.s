used_memory_avoider:
   mov    x2, 0xff                   // Move 0xff into x2 (temporary register)
   str    x2, [x1]                   // Store 0xff into memory address in x1 (rcx in x86-64)

   ldr    x8, [x0]                   // Load the value at memory address in x0 (rdi) into x8
                                     // This should be a secret, if x1 (rcx) is concretized, it is a concrete value

   and    x8, x8, 0xffff             // Mask x8 with 0xffff, keeping only the lower 16 bits

   ldr    x9, [x1]                   // Load the value at memory address in x1 (rsi) into x9 (for TransBase)

   ldr    x10, [x8, x9]              // Load value at address x8 + x9 into x10 (for transmission)

   b      0xdead0                     // Jump to address 0xdead0
