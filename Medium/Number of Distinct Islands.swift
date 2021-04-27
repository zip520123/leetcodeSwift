//Number of Distinct Islands
//O(m*n) O(m*n)
    func numDistinctIslands(_ grid: [[Int]]) -> Int {
        var set = Set<[[Int]]>()
        var grid = grid
        var currIsland = [[Int]]()
        let rows = grid.endIndex, cols = grid[0].endIndex
        func dfs(_ x: Int, _ y: Int) {
            if x < 0 || y < 0 || x == rows || y == cols || grid[x][y] == 0 {return}
            if grid[x][y] == 1 {
                grid[x][y] = 0
                currIsland.append([x,y])
                dfs(x+1,y)
                dfs(x-1,y)
                dfs(x,y+1)
                dfs(x,y-1)
            }
            
        }
        
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == 1 {
                    dfs(i,j)
                    for k in 0..<currIsland.endIndex {
                        currIsland[k][0] -= i
                        currIsland[k][1] -= j
                    }
                    set.insert(currIsland)
                    currIsland.removeAll()
                }
            }
        }
        return set.count
    }

    func numDistinctIslands(_ grid: [[Int]]) -> Int {
        var set = Set<String>()
        var grid = grid
        
        let rows = grid.endIndex, cols = grid[0].endIndex
        func dfs(_ x: Int, _ y: Int, _ path: String) -> String {
            if x < 0 || y < 0 || x == rows || y == cols || grid[x][y] == 0 {
                return "W"
            }
            
            grid[x][y] = 0
            var res = path    
            res += dfs(x+1,y,"D")
            res += dfs(x-1,y,"U")
            res += dfs(x,y+1,"R")
            res += dfs(x,y-1,"L")

            return res
        }
        
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == 1 {
                    let pathS = dfs(i,j,"")
                    set.insert(pathS)
                    
                }
            }
        }
        return set.count
    }