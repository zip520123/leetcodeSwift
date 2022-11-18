/*Rotate Image*/
//O(n), O(1)
    func rotate(_ matrix: inout [[Int]]) {
        let rows = matrix.endIndex, cols = matrix[0].endIndex
        for i in 0..<rows {
            for j in i..<cols {
                (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
            }
        }
        for row in 0..<rows {
            var l = 0, r = cols-1
            while l<r {
                (matrix[row][l], matrix[row][r]) = (matrix[row][r], matrix[row][l])    
                l += 1
                r -= 1
            }  
        }
    }