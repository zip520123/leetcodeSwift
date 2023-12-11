//Transpose Matrix
//O(n), O(1)
func transpose(_ matrix: [[Int]]) -> [[Int]] {
    let rows = matrix.endIndex, cols = matrix[0].endIndex
    let newRows = cols, newCols = rows
    var res = [[Int]](repeating: [Int](repeating: 0, count: newCols), count: newRows)
    for row in 0..<rows {
        for col in 0..<cols {
            res[col][row] = matrix[row][col]
        }
    }
    return res
}