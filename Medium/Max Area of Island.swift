//Max Area of Island
//O(n), O(n), n = grid
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var res = 0
        let rows = grid.endIndex, cols = grid[0].endIndex
        var grid = grid
        let direction = [0,1,0,-1,0]
        func dfs(_ x: Int, _ y: Int) -> Int {
            guard x >= 0, x<rows, y>=0, y<cols, grid[x][y] == 1 else {return 0}
            var curr = 1
            grid[x][y] = 0
            for k in 0..<4 {
                let newX = x+direction[k], newY = y+direction[k+1]
                curr += dfs(newX, newY)    
            }
            return curr
        }
        for i in 0..<rows {
            for j in 0..<cols {
                let curr = dfs(i,j)
                res = max(res, curr)
            }
        }
        return res
    }

//O(n), O(n)
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var res = 0
        var grid = grid
        let rows = grid.endIndex, cols = grid[0].endIndex
        
        func dfs(_ x: Int, _ y: Int) -> Int {
            guard x>=0, y>=0, x<rows, y<cols else {return 0}
            var count = 0
            if grid[x][y] == 0 {
                return count
            }    
            count = 1
            grid[x][y] = 0
            count += dfs(x+1,y)
            count += dfs(x,y+1)
            count += dfs(x-1,y)
            count += dfs(x,y-1)
            return count
        }

        for i in 0..<rows {
            for j in 0..<cols {
                res = max(res, dfs(i,j))
            }
        }
        return res
    }