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

//O(n*m), O(n+m)
    func setZeroes(_ matrix: inout [[Int]]) {
        let rows = matrix.endIndex, cols = matrix[0].endIndex
        var rowsMark = Set<Int>(), colsMark = Set<Int>()
        for i in 0..<rows {
            for j in 0..<cols {
                if matrix[i][j] == 0 {
                    rowsMark.insert(i)
                    colsMark.insert(j)
                }
            }
        }

        for i in rowsMark {
            for j in 0..<cols {
                matrix[i][j] = 0
            }
        }
        
        for i in 0..<rows {
            for j in colsMark {
                matrix[i][j] = 0
            }    
        }
        
    }

//O(n*m), O(1)
    func setZeroes(_ matrix: inout [[Int]]) {
        var firstRow = false, firstCol = false
        let rows = matrix.endIndex, cols = matrix[0].endIndex
        for i in 0..<cols {
            if matrix[0][i] == 0 {
                firstRow = true
            }
        }
        for i in 0..<rows {
            if matrix[i][0] == 0 {
                firstCol = true
            }
        }
        for i in 1..<rows {
            for j in 1..<cols {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }
        for i in 1..<cols {
            if matrix[0][i] == 0 {
                for j in 0..<rows {
                    matrix[j][i] = 0
                }
            }
        }
        for i in 1..<rows {
            if matrix[i][0] == 0 {
                for j in 0..<cols {
                    matrix[i][j] = 0
                }
            }
        }
        if firstRow {
            for i in 0..<cols {
                matrix[0][i] = 0
            }
        }
        if firstCol {
            for i in 0..<rows {
                matrix[i][0] = 0
            }
        }
    }