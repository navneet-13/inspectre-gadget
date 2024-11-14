uncontrolled_stored_in_mem:
   // Move constant 0x7000000 to memory address in x2 (rdx in x86-64)
   mov    w3, 0x7000000              // Move 0x7000000 into temporary register w3
   str    w3, [x2]                   // Store 0x7000000 into address pointed by x2 (rdx)

   ldr    w8, [x2]                   // Load 32-bit value from memory at x2 into w8 ([attacker] from memory)

   ldr    x9, [x0, 0xff]             // Load 64-bit value from address x0 + 0xff into x9 (secret)

   and    x9, x9, 0xffff             // Mask x9 to keep only lower 16 bits
   
   movz   x2, 0xffff, lsl #48
   movk   x2, 0xffff, lsl #32
   movk   x2, 0x8100, lsl #16
   movk   x2, 0x0
   add    x9, x9, x8
   ldr    x10, [x2, x9] // Load transmission from base address + x8 + x9

   // ---------------------------------------------------
   // Move constant 0x0 to memory address in x1 (rsi in x86-64)
   mov    w3, 0x0                    // Move 0x0 into temporary register w3
   str    w3, [x1]                   // Store 0x0 into memory address at x1 (rsi)

   ldr    w9, [x1]                   // Load 32-bit value from address x1 into w9 (secret)

   and    x9, x9, 0xffff             // Mask x9 to keep only lower 16 bits

   movz   x2, 0xffff, lsl #48
   movk   x2, 0xffff, lsl #32
   movk   x2, 0x8100, lsl #16
   movk   x2, 0x0
   ldr    x11, [x2, x9] // Load transmission from base address + x9

   // ---------------------------------------------------
   // Dereference constant address twice and use the result as a secret
   movz   x2, 0xffff, lsl #48
   movk   x2, 0xffff, lsl #32
   movk   x2, 0x8500, lsl #16
   movk   x2, 0x0     // Load constant address into x2
   ldr    x0, [x2]                   // Load value from address x2 into x0 (potential controlled value)

   ldr    x1, [x0]                   // Load 64-bit value from address in x0 into x1 (secret)

   ldr    x20, [x3, x1]              // Load transmission from address x3 + x1

   // Jump to address 0xdead0
   b      0xdead0                    // Branch to address 0xdead0
