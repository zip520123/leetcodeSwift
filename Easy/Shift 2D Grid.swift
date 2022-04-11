//Shift 2D Grid
//O(n), O(1)
class Solution {
    func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        var res = grid
        let rows = grid.endIndex, cols = grid[0].endIndex
        let n = rows*cols
        for row in 0..<rows {
            for col in 0..<cols {
                let currIndex = row*cols+col
                let newIndex = newIndex((currIndex+k)%n, cols)
                res[newIndex.row][newIndex.col] = grid[row][col]
            }
        }
        return res
    }
    
    func newIndex(_ index: Int, _ cols: Int) -> (row: Int, col: Int) {
        return (index/cols, index%cols)
    }
}