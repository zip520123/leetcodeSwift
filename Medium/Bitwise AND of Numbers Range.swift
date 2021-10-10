//Bitwise AND of Numbers Range
//O(n), O(1)
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var i = 0, l = left, r = right
        while l != r {
            l >>= 1
            r >>= 1
            i += 1
        }
        return l << i
        
    }