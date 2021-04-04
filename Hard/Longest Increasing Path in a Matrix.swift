/*Longest Increasing Path in a Matrix*/
//O(n!) O(1)
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        var res = 1
        let row = matrix.endIndex
        let col = matrix[0].endIndex
        var matrix = matrix
        func dfs(_ x:Int,_ y:Int, _ val:Int, _ path: Int) {
            if x < 0 || x == row || y < 0 || y == col || matrix[x][y] <= val {
                res = max(res,path) 
                return
            } 
            
            dfs(x+1,y,matrix[x][y],path+1)
            dfs(x-1,y,matrix[x][y],path+1)
            dfs(x,y+1,matrix[x][y],path+1)
            dfs(x,y-1,matrix[x][y],path+1)
        }
         
        for i in 0..<row {
            for j in 0..<col {
                dfs(i,j,Int.min,0)
            }
        }
        return res
    }
//O(n) O(n)
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        var res = 1
        let row = matrix.endIndex, col = matrix[0].endIndex

        var dict = [[Int]:Int]()
        func dfs(_ x:Int,_ y:Int, _ val:Int) -> Int {
            if x < 0 || x == row || y < 0 || y == col || matrix[x][y] <= val {
                return 0
            } 
            if dict[[x,y]] != nil {
                return dict[[x,y]]!
            }
            var curr = 0
            curr = max(curr,dfs(x+1,y,matrix[x][y]) + 1)
            curr = max(curr,dfs(x-1,y,matrix[x][y]) + 1)
            curr = max(curr,dfs(x,y+1,matrix[x][y]) + 1)
            curr = max(curr,dfs(x,y-1,matrix[x][y]) + 1)
            dict[[x,y]] = curr
            return curr
        }
         
        for i in 0..<row {
            for j in 0..<col {
                res = max(res,dfs(i,j,Int.min))
            }
        }
        return res
    }