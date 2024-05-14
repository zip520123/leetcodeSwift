// Path with Maximum Gold
// O(n^2), O(n)
func getMaximumGold(_ grid: [[Int]]) -> Int {
    var grid = grid
    var res = 0
    let rows = grid.endIndex, cols = grid[0].endIndex
    func dfs(_ path: Int, _ row: Int, _ col: Int) {
        guard row >= 0, row < rows, col >= 0, col < cols, grid[row][col] > 0 else {
            res = max(res, path)
            return 
        }
        let curr = path + grid[row][col]
        let temp = grid[row][col]
        grid[row][col] = 0
        dfs(curr, row+1, col)
        dfs(curr, row-1, col)
        dfs(curr, row, col+1)
        dfs(curr, row, col-1)
        grid[row][col] = temp
    }
    for row in 0..<rows {
        for col in 0..<cols {
            if grid[row][col] != 0 {
                dfs(0, row, col)
            }
        }
    }
    return res
}

// O(n^2), O(n)
func getMaximumGold(_ grid: [[Int]]) -> Int {
    var grid = grid
    var res = 0
    let rows = grid.endIndex, cols = grid[0].endIndex
    func dfs(_ row: Int, _ col: Int) -> Int {
        guard row >= 0, row < rows, col >= 0, col < cols, grid[row][col] > 0 else {
            return 0
        }
        let temp = grid[row][col]
        grid[row][col] = 0
        var next = 0
        next = max(next, dfs(row+1, col))
        next = max(next, dfs(row-1, col))
        next = max(next, dfs(row, col+1))
        next = max(next, dfs(row, col-1))
        grid[row][col] = temp
        return temp + next
    }
    for row in 0..<rows {
        for col in 0..<cols {
            if grid[row][col] != 0 {
                res = max(res, dfs(row, col))
            }
        }
    }
    return res
}