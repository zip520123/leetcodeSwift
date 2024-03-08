// Count Elements With Maximum Frequency
// O(n), O(n)
func maxFrequencyElements(_ nums: [Int]) -> Int {
    var memo = [Int: Int]()
    for n in nums {
        memo[n, default: 0] += 1
    }
    var maxFreq = 0
    var res = 0
    for val in memo.values {
        if val > maxFreq {
            maxFreq = val
            res = val
        } else if val == maxFreq {
            res += val
        }
    }
    return res
}