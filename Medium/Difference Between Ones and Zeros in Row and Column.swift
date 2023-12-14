// Difference Between Ones and Zeros in Row and Column
// O(n), O(n)
func onesMinusZeros(_ grid: [[Int]]) -> [[Int]] {
    let rows = grid.endIndex, cols = grid[0].endIndex
    var rowsDict = [Int: Int]()
    for i in 0..<rows {
        let row = grid[i]
        rowsDict[i] = row.reduce(0,+)
    }    
    var colsDict = [Int: Int]()
    for i in 0..<cols {
        var curr = 0
        for j in 0..<rows {
            curr += grid[j][i]
        }
        colsDict[i] = curr
    }
    var res = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)

    for row in 0..<rows {
        for col in 0..<cols {
            let onesRow = rowsDict[row]!
            let zeroRow = rows-onesRow
            let onesCol = colsDict[col]!
            let zeroCol = cols-onesCol
            res[row][col] = onesRow + onesCol - zeroRow - zeroCol
        }
    }

    return res
}