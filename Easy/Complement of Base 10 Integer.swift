//Complement of Base 10 Integer
//O(n),O(1)
    func bitwiseComplement(_ n: Int) -> Int {
        if n == 0 {return 1}
        var mask = 1, res = 0
        while mask < n {
            let curr = n & mask == 0 ? 1 : 0
            res += mask * curr
            mask *= 2
        }
        return res
    }