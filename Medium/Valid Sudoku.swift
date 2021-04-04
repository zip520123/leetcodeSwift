/*Valid Sudoku*/
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        let row = 9, col = 9
        var board = board
        func dfs(_ x:Int, _ y:Int, _ val: Character) -> Bool {
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
        
        for i in 0..<row {
            for j in 0..<col {
                if board[i][j] != "." {
                    let temp = board[i][j]
                    board[i][j] = "."
                    if dfs(i,j,temp) == false {
                        return false
                    }
                    board[i][j] = temp
                }
            }
        }
        return true
    }