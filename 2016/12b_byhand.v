/*                c=1
cpy 1 a           a=1
cpy 1 b           b=1
cpy 26 d          d=26
jnz c 2 --
jnz 1 5 -|---
cpy 7 c <-  |     c=7
inc d <---- |     d=27 28 |  => d=d+7
dec c     | |     c=6  5  | 7 times
jnz c -2 -- |
cpy a c <----<--    |
inc a <----    |    |  => a=fib(d+2)=121393
dec b     |    |    |
jnz b -2 --    |    |
cpy c b        |    |
dec d          |    | d times
jnz d -6 -------
cpy 19 c           c=19
cpy 14 d <----     d=14
inc a <----  |      | a=121393 + (d * c)
dec d     |  |      | d times         ^
jnz d -2 --  |                        |
dec c        |                        |
jnz c -5 -----    ---------------------
 */

fn fib(n int, mut memo map[int]int) int {
	if n < memo.len {
		return memo[n]
	}
	if n < 2 {
		memo[n] = 1
		return 1
	}
	memo[n] = fib(n - 1, mut memo) + fib(n - 2, mut memo)
	return memo[n]
}

fn main() {
	mut memo := map[int]int{}
	println(fib(26+2+7, mut memo) + 14 * 19)
}