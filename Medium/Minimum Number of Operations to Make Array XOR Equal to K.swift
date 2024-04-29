// Minimum Number of Operations to Make Array XOR Equal to K
// O(n), O(1)
func minOperations(_ nums: [Int], _ k: Int) -> Int {
    var curr = 0
    for n in nums {
        curr ^= n
    }
    curr ^= k
    var res = 0
    while curr > 0 {
        res += curr & 1
        curr >>= 1
    }
    return res
}