//Triangle
//O(rows*cols) O(rows*cols)
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var dp = triangle
        let rows = dp.endIndex
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