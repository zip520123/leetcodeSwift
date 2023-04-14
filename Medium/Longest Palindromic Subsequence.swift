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
        let arr = Array(s)
        let n = arr.endIndex
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        for i in (0..<n).reversed() {
            dp[i][i] = 1
            for j in (i+1)..<n {
                if arr[i] == arr[j] {
                    dp[i][j] = dp[i+1][j-1]+2
                } else {
                    dp[i][j] = max(dp[i+1][j], dp[i][j-1])
                }
            }
        }
        return dp[0][n-1]
    }