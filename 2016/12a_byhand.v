/*
cpy 1 a
cpy 1 b
cpy 26 d
jnz c 2 --
jnz 1 5 -|---
cpy 7 c <-  |
inc d <---- |
dec c     | |
jnz c -2 -- |
cpy a c <----<--   c=1  2  3  5  8  |
inc a <----    |   a=2  3  5  8  13 |  => a=fib(d+2)=121393
dec b     |    |   b=0  0  0  0  0  |
jnz b -2 --    |                    |
cpy c b        |   b=1  2  3  5  8  |
dec d          |   d=25 24 23 22 21 | 26 times
jnz d -6 -------
cpy 19 c           c=19
cpy 14 d <----     d=14
inc a <----  |     a=121394 121395  | a=121393+(14 * 19)
dec d     |  |     d=13     12      | 14 times       ^
jnz d -2 --  |                                       |
dec c        |                                       |
jnz c -5 -----    ------------------------------------
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
	println(fib(28, mut memo) + 14 * 19)
}