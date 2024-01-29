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
        var dp = [[Int]](repeating: [Int](repeating: 0, count: s.count + 1), count: s.count + 1)
        let arr2 = Array(arr.reversed())
        for i in 1...arr.endIndex {
            for j in 1...arr.endIndex {
                if arr[i-1] == arr2[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return dp[arr.endIndex][arr.endIndex]
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