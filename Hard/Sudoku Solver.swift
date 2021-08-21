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

class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        func dfs() -> Bool {
            for i in 0..<9 {
                for j in 0..<9 {
                    if board[i][j] == "." {
                        for k in 1...9 {
                            let char = Character(String(k))
                            if check(board, i, j, char) == true {
                                board[i][j] = char
                                if dfs() == true {
                                    return true
                                }
                            } 
                            board[i][j] = "." 
                        }
                        return false
                    }
                }
            }
            return true
        }
        dfs()
    }
    
    func check(_ board: [[Character]], _ row: Int, _ col: Int, _ char: Character) -> Bool {
        var count = 0
        for i in 0..<9 {
            if board[row][i] == char {count+=1}
            if board[i][col] == char {count+=1}
            if board[(row/3)*3+i/3][(col/3)*3+i%3] == char {count+=1}
        }
        return count == 0
    }
}