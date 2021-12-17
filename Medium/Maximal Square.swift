//Maximal Square
//O(mn), O(mn)
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        let rows = matrix.endIndex, cols = matrix[0].endIndex
        var dp = (0..<rows).map {_ in (0..<cols).map {_ in 0 }}
        var res = 0
        for i in 0..<cols {
            dp[0][i] = Int(String(matrix[0][i]))!
            res = max(res, dp[0][i])
        }
        for j in 0..<rows {
            dp[j][0] = Int(String(matrix[j][0]))!
            res = max(res, dp[j][0])
        }
        
        for i in 1..<rows {
            for j in 1..<cols {
                if matrix[i][j] == "1" {
                    dp[i][j] = min(dp[i][j-1],dp[i-1][j],dp[i-1][j-1]) + 1
                    res = max(res, dp[i][j])
                }
            }
        }
        return res * res
    }

//O(mn), O(n)
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        let rows = matrix.endIndex, cols = matrix[0].endIndex
        var dp = (0...cols).map {_ in 0 }
        var maxN = 0
        var prev = 0
        for i in 1...rows {
            for j in 1...cols {
                let temp = dp[j]
                if matrix[i-1][j-1] == "1" {
                    let curr = min(dp[j], dp[j-1], prev) + 1
                    dp[j] = curr
                    maxN = max(maxN, curr)
                } else {
                    dp[j] = 0
                }
                prev = temp
            }
        }
        return maxN * maxN
    }