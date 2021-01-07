/*Number of Islands*/
//time O(n) space O(1)
func numIslands(_ grid: [[Character]]) -> Int {
    var grid = grid
    let row = grid.count
    let col = grid[0].count
    
    func dfs(_ x:Int,_ y:Int) {
        if (x < 0 || x>=row || y < 0 || y>=col || grid[x][y] == "0") {return} 
        grid[x][y] = "0"
        dfs(x+1,y)
        dfs(x-1,y)
        dfs(x,y+1)
        dfs(x,y-1)
    }
    
    var res = 0
    for i in 0..<row {
        for j in 0..<col {
            if grid[i][j] == "1" {
                res += 1
                dfs(i,j)
            }
        }
    }
    return res
}