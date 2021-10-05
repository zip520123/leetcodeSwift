//Island Perimeter
//O(n), O(1)
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        let rows = grid.endIndex, cols = grid[0].endIndex
        var res = 0
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == 1 {
                    res += 4
                    if i-1 >= 0 && grid[i-1][j] == 1 {
                        res -= 2
                    }
                    if j-1 >= 0 && grid[i][j-1] == 1 {
                        res -= 2
                    }
                }
                
            }
        }
        return res
    }