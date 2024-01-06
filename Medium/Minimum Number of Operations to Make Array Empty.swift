// Minimum Number of Operations to Make Array Empty
// O(n), O(n)
func minOperations(_ nums: [Int]) -> Int {
    var memo = [Int: Int]()
    for n in nums {
        memo[n, default: 0] += 1
    }    
    var res = 0
    for (_, val) in memo {
        if val == 1 {return -1}
        res += Int((Double(val)/3.0).rounded(.up))
    }
    return res
}