//Transpose Matrix
//O(n), O(1)
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        let rows = matrix.endIndex, cols = matrix[0].endIndex
        var res = [[Int]](repeating: [Int](repeating: 0, count: rows), count: cols)
        
        for i in 0..<rows {
            for j in 0..<cols {
                res[j][i] = matrix[i][j]
            }
        }
        return res
    }