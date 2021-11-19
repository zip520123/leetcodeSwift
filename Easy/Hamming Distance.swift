//Hamming Distance
//O(n), O(1)
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var n = x ^ y
        var res = 0
        while n > 0 {
            res += n & 1
            n >>= 1
        }
        return res
    }