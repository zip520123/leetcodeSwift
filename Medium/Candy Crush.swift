//Candy Crush
//O(board ^ 2) O(cols)
class Solution {
    func candyCrush(_ board: [[Int]]) -> [[Int]] {
        var board = board
        let rows = board.endIndex, cols = board[0].endIndex
        var toDo = false
        for row in 0..<rows {
            var col = 0
            while col < cols-2 {
                let val = abs(board[row][col])
                if val != 0 && abs(board[row][col+1]) == val && abs(board[row][col+2]) == val {
                    board[row][col] = -val
                    board[row][col+1] = -val
                    board[row][col+2] = -val
                    toDo = true
                }
                col += 1
            }
        }
        for col in 0..<cols {
            var row = 0
            while row < rows-2 {
                let val = abs(board[row][col])
                if val != 0 && abs(board[row+1][col]) == val && abs(board[row+2][col]) == val {
                    board[row][col] = -val
                    board[row+1][col] = -val
                    board[row+2][col] = -val
                    toDo = true
                }
                row += 1
            }
        }
        for col in 0..<cols {
            var stack = [Int]()
            for row in 0..<rows {
                if board[row][col] > 0 {
                    stack.append(board[row][col])
                }
            }
            for row in (0..<rows).reversed() {
                if stack.isEmpty == false {
                    board[row][col] = stack.removeLast()
                } else {
                    board[row][col] = 0
                }
            }
        }
        
        return toDo ? candyCrush(board) : board
    }
}
//O(board ^ 2) O(1)
    func candyCrush(_ board: [[Int]]) -> [[Int]] {
        
        var board = board
        let rows = board.endIndex, cols = board[0].endIndex
        var toDo = false
        for row in 0..<rows {
            var col = 0
            while col < cols-2 {
                let val = abs(board[row][col])
                if val != 0 && abs(board[row][col+1]) == val && abs(board[row][col+2]) == val {
                    board[row][col] = -val
                    board[row][col+1] = -val
                    board[row][col+2] = -val
                    toDo = true
                }
                col += 1
            }
        }
        for col in 0..<cols {
            var row = 0
            while row < rows-2 {
                let val = abs(board[row][col])
                if val != 0 && abs(board[row+1][col]) == val && abs(board[row+2][col]) == val {
                    board[row][col] = -val
                    board[row+1][col] = -val
                    board[row+2][col] = -val
                    toDo = true
                }
                row += 1
            }
        }
        for col in 0..<cols {
            var row = rows - 1
            var p = rows - 1
            while row >= 0 {
                if board[row][col] > 0 {
                    board[p][col] = board[row][col]
                    p -= 1
                } 
                row -= 1
            }
            while p >= 0 {
                board[p][col] = 0
                p -= 1
            }
        }
        return toDo ? candyCrush(board) : board
    }