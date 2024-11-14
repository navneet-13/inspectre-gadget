complex_transmission:
   ldr x8, [x0]                // Load QWORD from [rdi] (secret)
   ldr x9, [x1]                // Load QWORD from [rsi] (transbase)
   add x9, x8, x9              // Add r8 (secret) to r9 (transbase)
   lsl x9, x9, #6              // Shift r9 left by 6

   ldr x10, [x9]               // Load QWORD from address r9 (transmission)

   // Use one value for a complex transmission
   ldr x8, [x0]                // Load QWORD from [rdi] (secret)
   ldr x9, [x1]                // Load QWORD from [rsi] (transbase)

   mov x0, #8                  // Set constant 8 in x0
   mul x8, x8, x0              // Multiply r8 (secret) by 8 (mul is used here)
   ldr x11, [x8]               // Load QWORD from address r8 (transmission)

   // Use two independent values for a complex transmission
   mov x0, x8                  // Copy r8 (secret) to x0
   mul x9, x9, x0              // Multiply r9 (transbase) by r8 (independent multiplication)
   ldr x12, [x9]               // Load QWORD from address r9 (transmission)

   // Use two dependent values for a complex transmission
   mov x0, x8                  // Copy r8 (secret) to x0
   mul x10, x0, x0             // Multiply r8 (secret) by itself (dependent multiplication)
   ldr x13, [x10]              // Load QWORD from address r8 (transmission)

   b 0xdead0                   // Jump to address 0xdead0
