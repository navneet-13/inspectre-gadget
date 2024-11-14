sign_extend:
      ldrsb   w0, [x1, #0x4]            // Sign-extend byte at [x1 + 0x4] to a 32-bit value (sign-extend to w0)
      mov     x2, x0                    // Copy the result to x2 (since AArch64 uses 64-bit registers)
      ldr     x3, [x2, #0x40]           // Load the value at [x2 + 0x40] into x3

      b       0xdead0                   // Jump to address 0xdead0
