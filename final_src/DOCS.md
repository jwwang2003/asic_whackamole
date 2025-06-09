# Module Unit Docs

## `seven_seg.v`

```verilog
//==========================================================
// seven_seg.v
//  Single‐digit seven‐segment (0–F) decoder.
//  Expects:
//    • `CLK_FREQ` to be defined externally (e.g. in a global header).
//    • Input:  4‐bit hex digit (0–F).
//    • Output: 7‐bit segment pattern: {a,b,c,d,e,f,g}, active HIGH.
//
//  If `CLK_FREQ` is not defined, it defaults to 50_000_000.
//==========================================================
```

## `four_digit_seg.v`

```verilog
//==========================================================
// four_digit_display.v
//  4‐digit multiplexed seven‐segment driver (0–F).
//
//  • Uses `seven_seg` internally.
//  • Expects `CLK_FREQ` to be defined externally (defaults to 50_000_000).
//  • Takes a 16‐bit input (4 hex nibbles).
//  • Scans at 100 Hz overall (so each digit is refreshed at 400 Hz).
//  • Outputs:
//      – seg[6:0]    : segment pattern for the active digit (active HIGH).
//      – digit_en[3:0]: digit enable lines (active LOW).
//
//----------------------------------------------------------
//  How it works:
//   1) The desired overall refresh rate is 100 Hz.
//   2) We have 4 digits => scan each at 100 Hz × 4 = 400 Hz.
//   3) scan_cnt_max = CLK_FREQ / (400).
//   4) A free‐running counter divides clk down to a 400 Hz tick.
//   5) On each tick, rotate through digit_idx = 0…3.
//   6) Select the corresponding 4‐bit nibble from 'value[15:0]'.
//   7) Drive `seven_seg` with that nibble.
//   8) Assert the matching digit_en line (active LOW).
//==========================================================
```