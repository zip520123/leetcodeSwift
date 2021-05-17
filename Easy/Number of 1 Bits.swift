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
func hammingWeight(_ n: Int) -> Int {
    var res = 0
    var n = n
    while n != 0 {
        res += n%2
        n >>= 1
    }
    return res
}