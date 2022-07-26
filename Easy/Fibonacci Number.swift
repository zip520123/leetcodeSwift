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
//O(n), O(1)
    func fib(_ n: Int) -> Int {
        if n == 0 {return 0}
        var a = 0, b = 1
        for _ in 1..<n {
            let temp = a+b
            a = b
            b = temp
        }
        return b
    }

//O(n), O(n)
    func fib(_ n: Int) -> Int {
        var dict = [Int: Int]()
        
        func dfs(_ n: Int) -> Int {
            if dict[n] != nil {return dict[n]!}
            if n == 0 {return 0}
            if n == 1 {return 1}
            let res = dfs(n-1) + dfs(n-2)
            dict[n] = res
            return res
        }
        
        return dfs(n)
    }