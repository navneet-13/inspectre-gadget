constraints_isolater:
   ldr     x8, [x1]                // Load 8 bytes from [x1] (equivalent to rdi) into x8
   ldrh    w9, [x1]                // Load halfword from [x1] into w9 (equivalent to movzx r9, WORD PTR [rdi])
   movz    x2, 0xffff, lsl #48
   movk    x2, 0xffff, lsl #32
   movk    x2, 0x8100, lsl #16
   movk    x2, 0x0
   add     x10, x9, x2   // Add offset 0x81000000 to x9 and store the result in x10
   ldr     x10, [x10]              // Load 8 bytes from address in x10 into x10 (transmission 0)

   ldrh    w0, [x1, #4]            // Load halfword from [x1 + 4] into w0 (equivalent to movzx rax, WORD PTR [rdi + 4])
   add     x11, x0, x2    // Add offset 0x81000000 to x0 and store the result in x11
   ldr     x11, [x11]              // Load 8 bytes from address in x11 into x11 (transmission 1)

   ldr     w0, [x1, #4]            // Load 4 bytes from [x1 + 4] into w0 (equivalent to mov ebx, DWORD PTR [rdi + 4])
   add     x12, x0, x2    // Add offset 0x81000000 to x0 and store the result in x12
   ldr     x12, [x12]              // Load 8 bytes from address in x12 into x12 (transmission 2)

   ldr     w0, [x1, #4]            // Load 4 bytes from [x1 + 4] into w0 (equivalent to mov rcx, QWORD PTR [rdi + 4])
   add     x13, x0, x2    // Add offset 0x81000000 to x0 and store the result in x13
   ldr     x13, [x13]              // Load 8 bytes from address in x13 into x13 (transmission 3)

   add     x14, x9, x12            // Add x9 (secret) and x12 (transmission 2) to calculate the address
   ldr     x14, [x14]              // Load the value from the address in x14 (transmission 4)

   b       0xdead0                 // Jump to address 0xdead0 (equivalent to jmp 0xdead0)
