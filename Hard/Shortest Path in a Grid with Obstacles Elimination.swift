//Shortest Path in a Grid with Obstacles Elimination
//O(mn^mn), O(mn), TLE
    func shortestPath(_ grid: [[Int]], _ k: Int) -> Int {
        var res = Int.max
        let rows = grid.endIndex, cols = grid[0].endIndex
        func dfs(_ x: Int, _ y: Int, _ currK: Int , _ path: Set<[Int]>) {
            guard x>=0, y>=0, x<rows, y<cols, currK >= 0 else {return}
            if x == rows-1 && y == cols-1 {
                res = min(res, path.count)
            }
            
            if path.contains([x+1,y]) == false && x+1 < rows {
                var newPath = path
                newPath.insert([x+1,y])
                if grid[x+1][y] == 1 {
                    dfs(x+1,y, currK-1, newPath)
                } else {
                    dfs(x+1,y, currK, newPath)
                }
            }
            if path.contains([x,y+1]) == false && y+1 < cols{
                var newPath = path
                newPath.insert([x,y+1])
                if grid[x][y+1] == 1 {
                    dfs(x,y+1, currK-1, newPath)
                } else {
                    dfs(x,y+1, currK, newPath)
                }
            }
            if path.contains([x-1,y]) == false && x-1 >= 0{
                var newPath = path
                newPath.insert([x-1,y])
                if grid[x-1][y] == 1 {
                    dfs(x-1,y, currK-1, newPath)
                } else {
                    dfs(x-1,y, currK, newPath)
                }
            }
            
            if path.contains([x,y-1]) == false && y-1 >= 0{
                var newPath = path
                newPath.insert([x,y-1])
                if grid[x][y-1] == 1 {
                    dfs(x,y-1, currK-1, newPath)
                } else {
                    dfs(x,y-1, currK, newPath)
                }
            }
        }
        dfs(0,0,k,Set<[Int]>())
        return res == Int.max ? -1 : res
        
    }