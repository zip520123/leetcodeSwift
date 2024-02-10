// Valid Palindrome III
// O(n^2), O(n^2) Longest Palindromic Subsequence
func isValidPalindrome(_ s: String, _ k: Int) -> Bool {
    let s1 = Array(s)
    let s2 = Array(s1.reversed())
    let n = s1.endIndex
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)
    
    for i in 1...n {
        for j in 1...n {
            if s1[i-1] == s2[j-1] {
                dp[i][j] = dp[i-1][j-1] + 1
            } else {
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
            }
        }
    }
    return n - dp[n][n] <= k
}

// O(n^2), O(n^2) distence between its reversed divied by 2
func isValidPalindrome(_ s: String, _ k: Int) -> Bool {
    let s1 = Array(s)
    let s2 = Array(s1.reversed())
    let n = s1.endIndex
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)
    for i in 1...n {
        dp[i][0] = dp[i-1][0] + 1
        dp[0][i] = dp[0][i-1] + 1
    }
    for i in 1...n {
        for j in 1...n {
            if s1[i-1] == s2[j-1] {
                dp[i][j] = dp[i-1][j-1]
            } else {
                dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + 1
            }
        }
    }
    return dp[n][n] / 2 <= k
}