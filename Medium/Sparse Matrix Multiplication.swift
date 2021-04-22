//Sparse Matrix Multiplication
//O(mat1.row * mat2.col * mat1.col) O(mat1.row * mat2.col)

    func multiply(_ mat1: [[Int]], _ mat2: [[Int]]) -> [[Int]] {
        let rows = mat1.endIndex, cols = mat2[0].endIndex
        var mat3 = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        for i in 0..<rows {
            for j in 0..<cols {
                var r = 0
                for k in 0..<mat1[0].endIndex {
                    r += mat1[i][k] * mat2[k][j]
                }
                mat3[i][j] = r
            }
        }
        return mat3    
    }

    
    func multiply(_ mat1: [[Int]], _ mat2: [[Int]]) -> [[Int]] {
        let rows = mat1.endIndex, cols = mat2[0].endIndex
        var mat3 = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        for i in 0..<rows {
            for k in 0..<mat1[0].endIndex {
                if mat1[i][k] == 0 {continue}
                for j in 0..<cols {
                    mat3[i][j] += mat1[i][k] * mat2[k][j]
                }
            }
        }
        return mat3    
    }