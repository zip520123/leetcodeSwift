//Power of Three
//O(log3 n)
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

//O(1), O(1)
    func isPowerOfThree(_ n: Int) -> Bool {
        return n > 0 && Int(pow(Double(3), 19)) % n == 0
    }