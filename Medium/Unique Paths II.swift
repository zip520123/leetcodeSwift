/*Unique Paths II*/
//O(n^2) O(1)
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        var grid = obstacleGrid
        var res = 0
        let row = grid.endIndex, col = grid[0].endIndex
        func dfs(_ x:Int, _ y:Int) {
            if x<0||x==row||y<0||y==col||grid[x][y]==1{return}
            if x == row - 1 && y == col - 1 {
                res+=1; return }
            var temp = grid[x][y]
            grid[x][y] = 1
            dfs(x+1,y)
            dfs(x,y+1)
            grid[x][y] = temp
        }
        
        dfs(0,0)
        return res
    }
//O(n) O(n) dp
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        var grid = obstacleGrid
        
        let row = grid.endIndex, col = grid[0].endIndex
        if grid[0][0] == 1 {return 0}
        var dp = [[Int]](repeating: [Int](repeating: 0, count: col), count: row)
        dp[0][0] = 1
        for i in 1..<row {
            dp[i][0] = grid[i][0] == 1 ? 0 : dp[i-1][0]
        }
        for i in 1..<col {
            dp[0][i] = grid[0][i] == 1 ? 0 : dp[0][i-1]
        } 
        for i in 1..<row {
            for j in 1..<col {
                dp[i][j] = grid[i][j] == 1 ? 0 : dp[i][j-1] + dp[i-1][j]
            }
        }
        return dp[row-1][col-1]
    }