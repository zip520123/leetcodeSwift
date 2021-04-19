//Fibonacci Number
    func fib(_ n: Int) -> Int {
        if n == 0 {return 0}
        var res = 1
        var prev1 = 0
        var prev2 = 1
        for _ in 1..<n {
            res = prev1 + prev2
            prev1 = prev2
            prev2 = res
        }
        return res
    }