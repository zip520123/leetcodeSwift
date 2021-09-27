//N-th Tribonacci Number
//O(n), O(1)
    func tribonacci(_ n: Int) -> Int {
        if n == 0 {return 0}
        if n == 1 {return 1}
        if n == 2 {return 1}
        var a = 0, b = 1, c = 1
        for i in 2..<n {
            let t = a+b+c
            a = b
            b = c
            c = t
        }
        return c
    }