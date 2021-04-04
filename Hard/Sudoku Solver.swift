/*Sudoku Solver*/
    func solveSudoku(_ board: inout [[Character]]) {
        
        func check(_ x:Int, _ y:Int, _ val: Character) -> Bool {
            for i in 0..<9 {
                if board[x][i] == val || board[i][y] == val {
                    return false
                }
            }
            for i in 0..<3 {
                for j in 0..<3 {
                    if board[(x/3)*3+i][(y/3)*3 + j] == val {return false}
                }
            }
            return true
        }
        
        func dfs() -> Bool {
            for i in 0..<9 {
                for j in 0..<9 {
                    if board[i][j] == "." {
                       for n in "123456789" {
                           if check(i,j,n) {
                               board[i][j] = n
                               if dfs() {
                                   return true
                               }
                               board[i][j] = "."
                           }
                           
                       }
                       return false
                    }
                }
            }
            return true
        }
        
        dfs()
        
    }