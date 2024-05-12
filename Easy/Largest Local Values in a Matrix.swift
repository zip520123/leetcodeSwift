// Largest Local Values in a Matrix
// O(n), O(n)
func largestLocal(_ grid: [[Int]]) -> [[Int]] {
    var res = [[Int]]()
    let rows = grid.endIndex, cols = grid[0].endIndex
    for row in 0..<rows-2 {
        var currRow = [Int]()
        for col in 0..<cols-2 {
            var curr = 0
            for i in row...row+2 {
                for j in col...col+2 {
                    curr = max(curr, grid[i][j])
                }
            }
            currRow.append(curr)
        }
        res.append(currRow)
    }
    return res
}