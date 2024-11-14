disjoin_sign_extend:
      ldr w0, [x1, #0x4]             // Load DWORD at [rcx + 0x4] into w0 (sign-extended)
      sxtw x0, w0                    // Sign-extend 32-bit w0 into 64-bit x0 (movsx)
      
      ldrh w1, [x0]                  // Load HALFWORD at [rdi] into w1 (movzx)
      ubfx w1, w1, #0, #16           // Zero-extend word into w1 (movzx)
      
      add x2, x0, x1                 // Add rax + rsi (x0 + x1) into x2
      mov x10, 0x4096
      add x2, x2, x10            // Add offset 0x4096 to x2
      
      ldr x3, [x2]                   // Load QWORD at [rax + rsi + 0x4096] into x3 (rdx)
      b 0xdead0                       // Jump to 0xdead0
