/*Rotate Image*/
func rotate(_ matrix: inout [[Int]]) {
        
    let row = matrix.count
    if row == 0 {
        return
    }
    let col = matrix[0].count
    for i in 0..<row {
        for j in i..<col {
            (matrix[i][j],matrix[j][i]) = (matrix[j][i],matrix[i][j])
        }
    }
    
    for i in 0..<row {
        var left = 0
        var right = col - 1
        
        while (left < right) {
            (matrix[i][left],matrix[i][right]) = (matrix[i][right],matrix[i][left])
            left += 1
            right -= 1
        }
        
    }
    
}