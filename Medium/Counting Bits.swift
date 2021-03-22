/*Counting Bits*/
//time O(n * num) space O(1)
func countBits(_ num: Int) -> [Int] {
    var res = [Int]()
    
    for i in 0...num {
        var k = i
        var curr = 0
        while k > 0 {
            curr += k & 1
            k = k >> 1
        }
        res.append(curr)
    }
    return res
}
//time O(n) space O(1)
func countBits(_ num: Int) -> [Int] {
    var res = Array<Int>(repeating: 0, count: num + 1)
    for i in 0...num {
        res[i] = res[i >> 1] + i & 1
    }
    
    return res
}
//time O(n) space O(1)
func countBits(_ num: Int) -> [Int] {
    if num == 0 {return [0]}
    var res = [0]
    for n in 1...num {
        var curr = n & 1
        curr += res[n>>1]
        res.append(curr)
    }
    return res
}