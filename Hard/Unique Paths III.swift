/*Unique Paths III*/
//O(n^2), O(n^2)
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        var res = 0, empty = 1, sx = 0, sy = 0, ex = 0, ey = 0
        let row = grid.endIndex, col = grid[0].endIndex
        var grid = grid
        for (i,row) in grid.enumerated() {
            for (j,item) in row.enumerated() {
                if item == 1 {
                    sx = i; sy = j
                } else if item == 2 {
                    ex = i; ey = j
                } else if item == 0 {
                    empty += 1
                }
            }
        }
        
        func dfs(_ x: Int, _ y: Int, _ empty: Int) {
            if x < 0 || x == row || y < 0 || y == col || grid[x][y] == -1 {return}
            if x == ex && y == ey {
                if empty == 0 {res += 1}
                return
            }
            let temp = grid[x][y]
            grid[x][y] = -1
            dfs(x+1,y,empty-1)
            dfs(x-1,y,empty-1)
            dfs(x,y+1,empty-1)
            dfs(x,y-1,empty-1)
            grid[x][y] = temp
        }
        
        dfs(sx,sy,empty)
        return res
    }

    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        var sx = 0, sy = 0, empty = 0
        let rows = grid.endIndex, cols = grid[0].endIndex
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == 1 {
                    sx = i; sy = j
                }
                if grid[i][j] == 0 {
                    empty += 1
                }
            }
        }
        var res = 0, grid = grid
        func dfs(_ x: Int, _ y: Int) {
            guard x>=0, x<rows, y>=0, y<cols else {return}
            if grid[x][y] == 2 {
                if empty == 0 {
                    res += 1
                }
            }
            if grid[x][y] == 0 {
                grid[x][y] = -1
                empty -= 1
                dfs(x+1,y)
                dfs(x-1,y)
                dfs(x,y+1)
                dfs(x,y-1)
                grid[x][y] = 0
                empty += 1
            }
        }
        dfs(sx+1,sy)
        dfs(sx-1,sy)
        dfs(sx,sy+1)
        dfs(sx,sy-1)
        return res
    }