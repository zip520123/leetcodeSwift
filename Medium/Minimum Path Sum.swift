//Minimum Path Sum
//O(n), O(n)
    func minPathSum(_ grid: [[Int]]) -> Int {
        let rows = grid.endIndex, cols = grid[0].endIndex
        var dp = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        dp[0][0] = grid[0][0]
        for i in 1..<cols {
            dp[0][i] = dp[0][i-1] + grid[0][i]
        }
        for i in 1..<rows {
            dp[i][0] = dp[i-1][0] + grid[i][0]
        }

        for row in 1..<rows {
            for col in 1..<cols {
                dp[row][col] = grid[row][col] + min(dp[row-1][col], dp[row][col-1])
            }
        }
        return dp[rows-1][cols-1]
    }