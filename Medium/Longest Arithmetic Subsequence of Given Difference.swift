// Longest Arithmetic Subsequence of Given Difference
//O(n), O(n)
    func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {
        var dp = [Int: Int]()
        var res = 0
        for n in arr {
            dp[n] = dp[n-difference, default: 0] + 1
            res = max(res, dp[n]!)
        }
        return res
    }