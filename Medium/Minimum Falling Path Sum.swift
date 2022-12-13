//Minimum Falling Path Sum
//O(n^2) O(n) bottom up
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        let rows = matrix.endIndex, cols = matrix[0].endIndex
        var dp = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        
        for i in 0..<cols {
            dp[rows - 1][i] = matrix[rows-1][i]
        }
        
        var i = rows - 2
        while i >= 0 {
            var j = 0
            while j < cols {
                var n = dp[i+1][j]
                if j > 0 {
                    n = min(n,dp[i+1][j-1])
                }
                if j < cols - 1 {
                    n = min(n,dp[i+1][j+1])
                }
                dp[i][j] = n + matrix[i][j]
                j += 1
            }
            i -= 1
        }

        return dp[0].min() ?? 0
    }

//O(n^2) O(n) top down
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        var dp = matrix
        let cols = matrix[0].endIndex
        for row in 1..<dp.endIndex {
            for col in 0..<dp[0].endIndex {
                dp[row][col] += min(dp[row-1][col], dp[row-1][min(cols-1,col+1)], dp[row-1][max(0,col-1)])
            }
        }
        return dp.last!.min() ?? 0
    }

//O(n), O(n)
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        var matrix = matrix
        let rows = matrix.endIndex, cols = matrix[0].endIndex
        for row in 1..<rows {
            for col in 0..<cols {
                if col == 0 {
                    matrix[row][col] += min(matrix[row-1][col], matrix[row-1][col+1])
                } else if col == cols-1 {
                    matrix[row][col] += min(matrix[row-1][col], matrix[row-1][col-1])
                } else {
                    matrix[row][col] += min(matrix[row-1][col], matrix[row-1][col-1], matrix[row-1][col+1])
                }
                
            }
        }
        return matrix[rows-1].min()!
    }