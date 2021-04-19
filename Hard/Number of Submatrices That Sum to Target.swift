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

    