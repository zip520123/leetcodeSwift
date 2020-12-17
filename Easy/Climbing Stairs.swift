/*Climbing Stairs*/
//time O(2^n) space O(2^n)
func climbStairs(_ n: Int) -> Int {
    if n == 1 {return 1}
    if n == 2 {return 2}
    return climbStairs(n-1) + climbStairs(n-2)
}
//time O(n) space O(1)
func climbStairs(_ n: Int) -> Int {
    if n == 1 {return 1}
    if n == 2 {return 2}
    var a = 1
    var b = 2
    var res = 0
    for _ in 3...n {
        res = a + b
        a = b
        b = res
        
    }
    return res
}