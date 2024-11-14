multiple_bb:
   ldr     x8, [x1]                  // Load value from [rdi] into x8 (concretizing rdi)
   ldrh    w9, [x1]                  // Load half-word from [rdi] (16-bit value) into w9 (this is similar to movzx in x86-64)

   cmp     x0, #0                    // Compare rax (x0 in AArch64) with 0
   beq     trans1                     // Branch to trans1 if equal (if rax == 0)
   b       trans0                     // Otherwise, branch to trans0

trans0:
   movz    x2, 0xffff, lsl #48
   movk    x2, 0xffff, lsl #32
   movk    x2, 0x8100, lsl #16
   movk    x2, 0x0
   add     x10, x9, x2       // Add offset 0x81000000 to x9 and store the result in x10
   ldr     x11, [x2]                  // Load value from [rsi] into x11
   b       end                        // Jump to end

trans1:
   add     x10, x8, x0                // Add rax (x0) to r8 and store in x10 (rax should be zero, so this is just r8)
   sub     x10, x10, #0x10            // Subtract 0x10 from x10 (this is equivalent to r8 + rax - 0x10)
   ldr     x11, [x2]                  // Load value from [rsi] into x11

end:
   b       0xdead0                    // Jump to 0xdead0
