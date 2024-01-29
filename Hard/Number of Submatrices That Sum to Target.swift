//Number of Submatrices That Sum to Target
//O(n*m^2) O(n)
    func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
        let rows = matrix.endIndex
        let cols = matrix[0].endIndex
        var matrix = matrix
        var res = 0
        for i in 0..<rows {
            for j in 1..<cols {
                matrix[i][j] += matrix[i][j-1]
            }
        }
        for i in 0..<cols {
            for j in i..<cols {
                var dict = [0:1]
                var sum = 0
                for row in 0..<rows {
                    sum += matrix[row][j] - (i > 0 ? matrix[row][i-1] : 0)
                    res += dict[sum-target, default:0]
                    dict[sum, default: 0]+=1
                }
            }
        }
        return res
    }

// O(n^2*m^2), O(nm), TLE
func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
    let rows = matrix.endIndex, cols = matrix[0].endIndex
    var dp = matrix
    for row in 0..<rows {
        for col in 0..<cols {
            let top = row > 0 ? dp[row-1][col] : 0
            let left = col > 0 ? dp[row][col-1] : 0
            let top_left = row > 0 && col > 0 ? dp[row-1][col-1] : 0
            dp[row][col] = matrix[row][col] + top + left - top_left
        }
    }
    
    var res = 0
    for r1 in 0..<rows {
        for r2 in r1..<rows {
            for c1 in 0..<cols {
                for c2 in c1..<cols {
                    let top = r1 > 0 ? dp[r1-1][c2] : 0
                    let left = c1 > 0 ? dp[r2][c1-1] : 0
                    let top_left = r1 > 0 && c1 > 0 ? dp[r1-1][c1-1] : 0
                    let curr_sum = dp[r2][c2] - top - left + top_left
                    if curr_sum == target {res += 1}
                }
            }
        }
    }
    return res
}

// O(n*m^2), O(mn)
func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
    let rows = matrix.endIndex, cols = matrix[0].endIndex
    var dp = matrix
    for row in 0..<rows {
        for col in 0..<cols {
            let top = row > 0 ? dp[row-1][col] : 0
            let left = col > 0 ? dp[row][col-1] : 0
            let top_left = row > 0 && col > 0 ? dp[row-1][col-1] : 0
            dp[row][col] = matrix[row][col] + top + left - top_left
        }
    }
    
    var res = 0
    for r1 in 0..<rows {
        for r2 in r1..<rows {
            var memo = [0:1]

            for c in 0..<cols {
                let top = r1 > 0 ? dp[r1-1][c] : 0
                let curr_sum = dp[r2][c] - top
                res += memo[curr_sum-target, default: 0]
                memo[curr_sum, default: 0] += 1
            }
        }
    }
    return res
}