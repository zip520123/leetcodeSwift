//Power of Two
//O(1)
    func isPowerOfTwo(_ n: Int) -> Bool {
         n > 0 && ((n & (n-1)) == 0)
    }

//O(n)
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n <= 0 {return false}
        var n = n
        while n % 2 == 0 {
            n /= 2
        }
        return n == 1
    }