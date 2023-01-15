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

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] != "." {
                    if check(board[i][j], i,j,board) == false {
                        return false
                    }
                }
            }
        }
        return true
    }
    
    func check(_ char: Character, _ row: Int, _ col: Int, _ board: [[Character]]) -> Bool {
        var count = 0
        for i in 0..<9 {
            if board[row][i] == char {count += 1}
            if board[i][col] == char {count += 1}
            if board[(row/3)*3+i/3][(col/3)*3+i%3] == char {count += 1}
        }
        return count <= 3
    }
}

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] != "." {
                    if check(board, i,j) == false {
                        return false
                    }
                }
            }
        }
        return true
    }

    func check(_ board: [[Character]], _ x: Int, _ y: Int) -> Bool {
        let char = board[x][y]
        for i in 0..<9 {
            if board[x][i] == char && y != i {
                return false
            }

            if board[i][y] == char && x != i {
                return false
            }
            let row = (x/3)*3+i/3, col = (y/3)*3+i%3
            if board[row][col] == char && row != x && col != y {
                return false
            }
        }
        return true
    }
}