constraint_secret:
   ldrh w9, [x0]                // Load halfword (16-bit) from [rdi] into w9 (equivalent to movzx)
   mov x10, 0xffff
   cmp w9, w10              // Compare w9 with 0xffff
   b.gt trans1                  // If greater than, jump to trans1

   movz x11, 0x8000, lsl #16
   movk x11, 0x0
   sub x1, x9, x11      // Subtract 0x80000000 from w9 and store in x1 (transmission 0)
   ldr x1, [x1]                 // Load QWORD from [x1] into x1 (rsi)
   cmp w9, #0xff                // Compare w9 with 0xff
   b.gt trans1                  // If greater than, jump to trans1

   movz x12, 0x7000, lsl #16
   movk x12, 0x0
   sub x2, x9, x12      // Subtract 0x70000000 from w9 and store in x2 (transmission 1)
   ldr x2, [x2]                 // Load QWORD from [x2] into x2 (r10)
   b end                        // Jump to end

trans1:
   ldrh w9, [x0, #0x20]         // Load halfword (16-bit) from [rdi + 0x20] into w9
   cmp w9, #0x0                 // Compare w9 with 0
   b.eq end                     // If equal to 0, jump to end

   movz x13, 0x6000, lsl #16
   movk x13, 0x0
   sub x3, x9, x13      // Subtract 0x60000000 from w9 and store in x3 (transmission 2)
   ldr x3, [x3]                 // Load QWORD from [x3] into x3 (r11)

end:
   b 0xdead0                    // Jump to 0xdead0
