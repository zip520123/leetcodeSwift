/*Set Matrix Zeroes*/
//time O(m*n) space O(m*n)
func setZeroes(_ matrix: inout [[Int]]) {
    var m = matrix
    let rowc = m.count
    let colc = m[0].count
    for (i,row) in matrix.enumerated() {
        for (j,col) in row.enumerated() {
            if col == 0 {
                m[i][j] = 0 
                
                for k in 0..<colc {
                    m[i][k] = 0
                }
                
                for k in 0..<rowc {
                    m[k][j] = 0
                }
            }
        }
    }
    for i in 0..<rowc {
        for j in 0..<colc {
            matrix[i][j] = m[i][j]
        }
    }
}