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