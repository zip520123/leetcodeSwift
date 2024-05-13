// Score After Flipping Matrix
// O(n), O(n)
func matrixScore(_ grid: [[Int]]) -> Int {
    var grid = grid
    let rows = grid.endIndex, cols = grid[0].endIndex
    for row in 0..<rows {
        if grid[row][0] == 0 {
            for col in 0..<cols {
                grid[row][col] = 1 - grid[row][col]
            }
        }
    }
    for col in 0..<cols {
        var zeros = 0, ones = 0
        for row in 0..<rows {
            if grid[row][col] == 0 {
                zeros += 1
            } else {
                ones += 1
            }
        }
        if zeros > ones {
            for row in 0..<rows {
                grid[row][col] = 1 - grid[row][col]
            }
        }
    }
    var res = 0
    for row in 0..<rows {
        for col in 0..<cols {
            res += grid[row][col] << (cols-col-1)
        }
    }
    return res
}