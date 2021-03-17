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
//time O(n) space O(1)
func setZeroes(_ matrix: inout [[Int]]) {
    let row = matrix.endIndex
    if row == 0 {return}
    let col = matrix[0].endIndex
    
    var i = 0
    while i < row  {
        var j = 0
        while j < col {
            if matrix[i][j] == 0 {
                matrix[i][j] = -Int.max
            }
            j+=1
        }
        i+=1
    }
    
    i = 0
    while i < row {
        var j = 0
        while j < col {
            if matrix[i][j] == -Int.max {
                for index in 0..<row {
                    if matrix[index][j] != -Int.max {
                        matrix[index][j] = 0    
                    } 
                }
                for index in 0..<col {
                    if matrix[i][index] != -Int.max {
                        matrix[i][index] = 0    
                    }
                }
            }
            j+=1
        }
        i+=1
    }
    
    i = 0
    while i < row {
        var j = 0
        while j < col {
            if matrix[i][j] == -Int.max {
                matrix[i][j] = 0
            }
            j+=1
        }
        i+=1
    }
}