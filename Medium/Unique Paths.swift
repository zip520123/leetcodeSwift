/*Unique Paths*/
func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var dp = Array<[Int]>(repeating: Array<Int>(repeating: 0,count:n), count: m)
    
    for i in 0..<n {
        dp[0][i] = 1
    }
    
    for i in 0..<m {
        dp[i][0] = 1
    }
    
    for i in 1..<m {
        for j in 1..<n {
            dp[i][j] = dp[i-1][j] + dp[i][j-1]
        }
    }
    return dp[m-1][n-1]
}
