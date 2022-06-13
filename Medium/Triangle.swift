//Triangle
//bottom-up O(rows*cols) O(rows*cols)
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var dp = triangle
        var i = dp.endIndex - 2
        while i >= 0 {
            let cols = dp[i].endIndex
            var j = 0
            while j < cols {
                dp[i][j] += min(dp[i+1][j],dp[i+1][j+1])
                j += 1
            }
            i -= 1
        }
        return dp[0][0]
    }

//top-down, O(n), O(n)
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var mat = triangle
        let rows = mat.endIndex
        for i in 1..<rows {
            let row = mat[i]
            for j in 0..<row.endIndex {
                if j == 0 {
                    mat[i][j] += mat[i-1][j]
                } else if j == row.endIndex-1 {
                    mat[i][j] += mat[i-1][j-1]
                } else {
                    mat[i][j] += min(mat[i-1][j-1], mat[i-1][j])    
                }
            }
        }
        return mat[rows-1].min()!
    }