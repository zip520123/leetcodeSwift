/*Surrounded Regions*/
//O(n), O(n)
    func solve(_ board: inout [[Character]]) {
        let rows = board.endIndex, cols = board[0].endIndex
        func dfs(_ x:Int,_ y:Int) {
            guard x>=0, x<rows, y>=0, y<cols else {return}
            if board[x][y] == "O" {
                board[x][y] = "*"
                dfs(x+1,y)
                dfs(x-1,y)
                dfs(x,y+1)
                dfs(x,y-1)    
            }
            
        }
        
        for i in 0..<rows {
            dfs(i,0)
            dfs(i,cols-1)
        }
        for i in 0..<cols {
            dfs(0,i)
            dfs(rows-1,i)
        }
        
        for i in 0..<rows {
            for j in 0..<cols {
                if board[i][j] == "*" {
                    board[i][j] = "O"   
                } else if board[i][j] == "O" {
                    board[i][j] = "X"
                }
            }
        }
    }