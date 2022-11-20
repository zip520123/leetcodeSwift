//Ugly Number
//O(log n), O(1)
    func isUgly(_ n: Int) -> Bool {
        if n == 0 {return false}
        var n = n
        for p in [2,3,5] {
            var curr = 1
            while n % (curr * p) == 0 {
                curr *= p
            }
            
            n /= curr
        }
        return n == 1
    }