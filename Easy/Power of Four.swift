//Power of Four
//O(log n), O(1)
    func isPowerOfFour(_ n: Int) -> Bool {
        if n == 0 {return false}
        var i = 0, curr = 1
        while true {
            let curr = Int(pow(Double(4), Double(i))) 
            if n == curr {return true} 
            else if n < curr {
                return false
            }
            i += 1
        }
        return false
    }

//O(log n), O(1)
    func isPowerOfFour(_ n: Int) -> Bool {
        var p = 1
        if p == n {return true}
        while p < n {
            p *= 4
            if p == n {
                return true
            }
        }
        return false
    }

//O(1), O(1)
    func isPowerOfFour(_ n: Int) -> Bool {
        let mask = Int("1010101010101010101010101010101", radix: 2)!
        return n > 0 && n & (n-1) == 0 && (mask & n) == n
    }