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