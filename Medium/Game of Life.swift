//Game of Life
//O(n) O(n)
func gameOfLife(_ board: inout [[Int]]) {
        let rows = board.endIndex
        let cols = board[0].endIndex
        var cloneBoard = board
        for i in 0..<rows {
            for j in 0..<cols {
                var lives = 0
                if i-1 >= 0 {
                    lives += board[i-1][j]
                } 
                if j-1 >= 0 {
                    lives += board[i][j-1]
                }
                if i+1 < rows {
                    lives += board[i+1][j]
                }
                if j+1 < cols {
                    lives += board[i][j+1]
                }
                if i-1 >= 0 && j-1 >= 0 {
                    lives += board[i-1][j-1]
                }
                if i-1 >= 0 && j+1 < cols {
                    lives += board[i-1][j+1]
                }
                if i+1 < rows && j+1 < cols {
                    lives += board[i+1][j+1]
                }
                if i+1 < rows && j-1 >= 0 {
                    lives += board[i+1][j-1]
                }
                if board[i][j] == 1 {
                    if lives < 2 {
                        cloneBoard[i][j] = 0
                    } else if lives <= 3 {
                        cloneBoard[i][j] = 1
                    } else if lives > 3 {
                        cloneBoard[i][j] = 0
                    }
                } else {
                    if lives == 3 {
                        cloneBoard[i][j] = 1
                    }
                }
            }
        }
        board = cloneBoard
    }

//O(n),O(1)
    class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        let rows = board.endIndex, cols = board[0].endIndex
        for row in 0..<rows {
            for col in 0..<cols {
                let curr = board[row][col]
                if curr == 1 {
                    let neiIsLive = nei(row,col,board, cal: { $0>=1 })
                    if neiIsLive < 2 || neiIsLive > 3 {
                        board[row][col] = 2
                    }
                } else {
                    let neiIsLive = nei(row, col,board, cal: {$0>=1})
                    if neiIsLive == 3 {
                        board[row][col] = -1
                    }
                }
            }
        }
        for row in 0..<rows {
            for col in 0..<cols {
                if board[row][col] == 2 {
                    board[row][col] = 0
                } else if board[row][col] == -1 {
                    board[row][col] = 1
                }
            }
        }
    }
    
    func nei(_ row: Int, _ col: Int,_ board: [[Int]], cal: ((Int)->(Bool))) -> Int {
        var neiCount = 0
        for x in row-1...row+1 {
            for y in col-1...col+1 {
                if x>=0, x<board.endIndex, y>=0, y<board[0].endIndex, !(x==row && y==col) {
                    if cal(board[x][y]) {
                        neiCount += 1
                    }
                }
            }
        }
        return neiCount
    }

}