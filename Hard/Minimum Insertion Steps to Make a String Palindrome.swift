//Minimum Insertion Steps to Make a String Palindrome
//O(n^2) O(n^2)
    func minInsertions(_ s: String) -> Int {
        let n = s.count
        let arr1 = Array(s), arr2 = Array(arr1.reversed())
        var memo = [[Int]](repeating: [Int](repeating: -1, count: n+1), count: n+1)
        
        func dfs(_ m: Int, _ n: Int) -> Int {
            if m==0 || n==0 {return 0}
            if memo[m][n] != -1 {return memo[m][n]}
            if arr1[m-1] == arr2[n-1] {
                memo[m][n] = 1 + dfs(m-1,n-1)
                return memo[m][n]
            } 
            memo[m][n] = max(dfs(m-1,n), dfs(m,n-1))
            return memo[m][n]
        }
        return n - dfs(n,n)
    }

//O(n^2) O(n^2)
    func minInsertions(_ s: String) -> Int {
        let n = s.count
        let arr1 = Array(s), arr2 = Array(arr1.reversed())
        var dp = [[Int]](repeating: [Int](repeating: -1, count: n+1), count: n+1)
        
        func dfs(_ m: Int, _ n: Int) -> Int {
            for i in 0...m {
                for j in 0...n {
                    if i==0 || j==0 {
                        dp[i][j] = 0
                    } else if arr1[i-1] == arr2[j-1] {
                        dp[i][j] = 1 + dp[i-1][j-1]
                    } else {
                        dp[i][j] = max(dp[i-1][j],dp[i][j-1])
                    }
                }
            }
            return dp[m][n]
        }
        return n - dfs(n,n)
    }