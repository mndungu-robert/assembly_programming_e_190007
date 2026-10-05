# Division and EFLAGS

This section examines the unsigned `div` instruction in `div1.asm` and `div2.asm`. The results below are the quotient and remainder produced by each division. The arithmetic flags **CF, OF, SF, ZF, AF, and PF are undefined after `div`**. 

`DIV` does not change the interrupt flag (`IF`), so its displayed state is not a result of the division.

## `div1.asm`

The program loads 100 into `AX` and 7 into `BL`. The 8-bit `div bl` instruction divides the 16-bit value in `AX` by `BL`. It places the 8-bit quotient in `AL` and the 8-bit remainder in `AH`:

`100 ÷ 7 = 14 remainder 2`

After division, `AL = 14` and `AH = 2`. This satisfies `100 = (7 × 14) + 2`, with a remainder smaller than the divisor. The quotient fits in `AL`, so the division completes without a divide error.

**Flag changes:** The `mov` instructions before `div bl` leave flags unchanged. After `DIV`, **CF, OF, SF, ZF, AF, and PF are undefined**: their values are not guaranteed to be either set or cleared, and do not describe the quotient or remainder. `IF` is unchanged. The following `mov eax, 1` also leaves flags unchanged. Later, `xor ebx, ebx` clears `CF` and `OF`, sets `ZF` and `PF` because its result is zero, and clears `SF`. `AF` is undefined after `XOR`; `IF` remains unchanged. These later flag values come from `XOR`, not `DIV`.



## `div2.asm`

The program forms the 32-bit dividend `DX:AX` with `DX = 0` and `AX = 50000`, then loads the 16-bit divisor 300 into `BX`. The 16-bit `div bx` instruction divides `DX:AX` by `BX`. It places the 16-bit quotient in `AX` and the 16-bit remainder in `DX`:

`50000 ÷ 300 = 166 remainder 200`

After division, `AX = 166` and `DX = 200`. This satisfies `50000 = (300 × 166) + 200`, with a remainder smaller than the divisor. The quotient fits in `AX`, so the division completes without a divide error.

**Flag changes:** The `mov` instructions before `div bx` leave flags unchanged. After `DIV`, **CF, OF, SF, ZF, AF, and PF are undefined**: their values are not guaranteed to be either set or cleared, and do not describe the quotient or remainder. `IF` is unchanged. The following `mov eax, 1` also leaves flags unchanged. Later, `xor ebx, ebx` clears `CF` and `OF`, sets `ZF` and `PF` because its result is zero, and clears `SF`. `AF` is undefined after `XOR`; `IF` remains unchanged. These later flag values come from `XOR`, not `DIV`.