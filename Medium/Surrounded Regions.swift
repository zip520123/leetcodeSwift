/*Surrounded Regions*/
//O(n)
    func solve(_ board: inout [[Character]]) {
        let row = board.endIndex, col = board[0].endIndex
        func dfs(_ x:Int,_ y:Int) {
            guard x>=0, x<rows, y>=0, y<cols else {return}
            board[x][y] = "*"
            dfs(x+1,y)
            dfs(x-1,y)
            dfs(x,y+1)
            dfs(x,y-1)
        }
        
        for i in 0..<row {
            dfs(i,0)
            dfs(i,col-1)
        }
        for i in 0..<col {
            dfs(0,i)
            dfs(row-1,i)
        }
        
        for i in 0..<row {
            for j in 0..<col {
                if board[i][j] == "*" {
                    board[i][j] = "O"   
                } else if board[i][j] == "O" {
                    board[i][j] = "X"
                }
            }
        }
    }