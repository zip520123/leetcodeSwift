//Power of Three
//O(log n)
    func isPowerOfThree(_ n: Int) -> Bool {
        var p = 1
        if p == n {
            return true
        }
        while p < n {
            p *= 3
            if p == n {
                return true
            }
        }
        return false
    }