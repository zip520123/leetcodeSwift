//Longest Palindromic Subsequence
//O(n^2), O(n^2)
    func longestPalindromeSubseq(_ s: String) -> Int {
        let arr = Array(s)
        let n = arr.endIndex
        var dp = [[Int]](repeating: [Int](repeating:0, count:n), count:n)
        func dfs(_ l: Int, _ r: Int) -> Int {
            if dp[l][r] != 0 {return dp[l][r]}
            if l>r {return 0}
            if l==r {return 1}
            if arr[l]==arr[r] {
                dp[l][r] = dfs(l+1,r-1)+2
            } else {
                dp[l][r] = max(dfs(l,r-1), dfs(l+1,r))
            }
            return dp[l][r]
        }
        return dfs(0,n-1)
    }

//O(n^2), O(n^2)
    func longestPalindromeSubseq(_ s: String) -> Int {
        let s1 = Array(s), s2 = Array(s1.reversed())
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
        return dp[n][n]
    }

// O(n^2), O(n^2)
    func longestPalindromeSubseq(_ s: String) -> Int {
        let s1 = Array(s), s2 = Array(s1.reversed())
        let n = s1.endIndex

        var dp = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)
        for i in 1...n {
            dp[0][i] = dp[0][i-1] + 1
            dp[i][0] = dp[i-1][0] + 1
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

        return n - dp[n][n] / 2
    }

/*
 _ b b b a b
_0 0 0 0 0 0
b0 1 1 1 1 1
a0 1 1 1 2 2
b0 1 2 2 2 3
b0 1 2 3 3 3
b0 1 2 3 3 4

 _ a a b c b a
_0 0 0 0 0 0 0
a0 1 1 1 1 1 1
b0 1 1 2 2 2 2 
c0 1 1 2 3 3 3
b0 1 1 2 3 4 4
a0 1 2 2 3 4 5
a0 1 2 2 3 4 5
*/