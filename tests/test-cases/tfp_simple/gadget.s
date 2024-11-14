tainted_func_ptr:
    ldr     x1, [x0]                // Load qword from [rdi] into x1 (rsi <- [rdi])
    ldr     x0, [x2, x1]            // Load qword from [rcx + rsi] into x0 (rax <- [rcx + rsi])
    ldr     x2, [x0, #0x20]         // Load qword from [rdi + 0x20] into x2 (rcx <- [rdi + 0x20])
    ldr     x12, [x8]               // Load qword from [r8] into x12 (r12 <- [r8])
    mov     x8, xzr                 // Clear x8 (equivalent to `xor r8, r8`)
    lsl     x0, x0, #2              // Shift x0 left by 2 (equivalent to `shl rax, 0x2`)
    b       __aarch64_indirect_thunk_array  // Branch to __aarch64_indirect_thunk_array

__aarch64_indirect_thunk_array:
    b       0xdead0                 // Branch to 0xdead0 (equivalent to `jmp 0xdead0`)
