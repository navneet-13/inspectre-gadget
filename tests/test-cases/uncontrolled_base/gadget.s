uncontrolled_base:
    ldrb    w8, [x0]                  // load of secret (x8 as zero-extended register)
    ldr     x1, [x28, #0x2ac8]       // base load 1 (gs is emulated by using a known offset from x28)

    // Not exploitable, uncontrolled base
    ldr     x2, [x1]                  // base load 2
    ldr     x2, [x2]                  // base load 3
    ldr     x2, [x2, x8]              // transmission 1

    // Exploitable, fully controllable base
    ldr     x9, [x1]                  // base load 2
    add     x9, x9, x3                // add controllable offset (x3 corresponds to rbx)
    ldr     x9, [x9, x8]              // transmission 2

    // Known false positive: uncontrollable base with small controllable part
    ldr     x10, [x1]                 // base load 2
    and     x11, x4, #0xff            // restrict to 0xff (x4 used as r11)
    add     x10, x10, x11             // add small controllable offset
    ldr     x10, [x10, x8]            // transmission 3

    ret
