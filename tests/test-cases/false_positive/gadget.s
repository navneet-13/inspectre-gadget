has_bh_in_lru:
   movz x0, 0x2, lsl #16
   movk x0, 0x7700              // Load 0x27700 into x0
   lsl x1, x0, #3                   // Multiply x0 by 8 (shift left by 3)
   movz x10, 0x7d9d, lsl #16
   movk x10, 0xd7a0
   sub x1, x1, x10
   ldr x2, [x1]       // Load value from (x1 + offset - 0x7d9dd7a0) into x2
   add x0, x0, x2                   // Add x2 to x0
   lsl x1, x1, #3
   sub x1, x1, x10                  // Multiply xdi by 8 (shift left by 3)
   ldr x2, [x1]       // Load value from (x1 + offset - 0x7d9dd7a0) into x2
   add x0, x0, x2                   // Add x2 to x0
   add x1, x0, #0x80                // Compute rax + 0x80 and store in x1 (rdx)
   ldr x2, [x0]                     // Load value from address pointed by x0
   cmp x2, #0                        // Compare the loaded value with zero
   b 0xdead0                         // Jump to 0xdead0
