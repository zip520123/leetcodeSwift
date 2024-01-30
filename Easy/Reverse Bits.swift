/*Reverse Bits*/
//O(1), O(1)
func reverseBits(_ n: Int) -> Int {
    var n = n
    var result = 0
    for _ in 0..<32 {
        result <<= 1
        result += n & 1
        n >>= 1
    }
    return result
}

//O(1), O(1)
func reverseBits(_ n: Int) -> Int {
    var n = n
    var res = [Int]()
    for i in 0..<32 {
        res.append(n&1)
        n >>= 1
    }
    let curr = res.map{ String($0) }.joined()
    
    return Int(curr, radix: 2) ?? 0
}