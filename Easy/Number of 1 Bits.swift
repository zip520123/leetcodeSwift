/*Number of 1 Bits*/
func hammingWeight(_ n: Int) -> Int {
    var n = n
    var res = 0
    while n != 0 {
        res += n & 1
        n >>= 1
    }
    return res
}