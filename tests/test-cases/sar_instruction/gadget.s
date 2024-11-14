sar_instruction:
   cmp     w8, #0                  // Compare w8 (r8) with 0
   beq     trans1                  // If w8 == 0, jump to trans1

trans0:
   ldrh    w0, [x2]                // Load halfword from [x2] (rsi) into w0 (eax)
   asr     w0, w0, #8              // Arithmetic shift right (SAR) by 8
   movz    x4, 0x8100, lsl #16
   movk    x4, 0x0
   add     x3, x0, x4     // Add 0x81000000 to the value in x0 (rax)
   ldr     x11, [x3]               // Load the value from the address in x3 into x11 (r11)
   b       end                     // Jump to the end

trans1:
   ldrh    w0, [x2]                // Load halfword from [x2] (rsi) into w0 (eax)
   ldr     x3, [x1, #0xb8]         // Load the QWORD from [x1 + 0xb8] (rdi + 0xb8) into x3
   tbz     x3, #0, end               // Test the bit (x3, bit number w0), branch if bit is clear (performing the bit test)
   // No operation if the bit is set
end:
   b       0xdead0                  // Jump to the address 0xdead0
