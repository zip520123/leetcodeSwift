//Design Tic-Tac-Toe
//O(4*n) O(n^2)
class TicTacToe {
    let n : Int
    var grid : [[Int]]
    init(_ n: Int) {
        grid = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        self.n = n
    }
    
    /** Player {player} makes a move at ({row}, {col}).
        @param row The row of the board.
        @param col The column of the board.
        @param player The player, can be either 1 or 2.
        @return The current winning condition, can be either:
                0: No one wins.
                1: Player 1 wins.
                2: Player 2 wins. */
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        grid[row][col] = player
        var count = 0
        for i in 0..<n {
            if grid[row][i] == player {
                count += 1
            }
        }
        if count == n {return player}
        count = 0
        for i in 0..<n {
            if grid[i][col] == player {
                count += 1
            }
        }
        if count == n {return player}
        count = 0
        for i in 0..<n {
            if grid[i][i] == player {
                count += 1
            }
        }
        if count == n {return player}
        count = 0
        for i in 0..<n {
            if grid[i][n-i-1] == player {
                count += 1
            }
        }
        if count == n {return player}
        
        return 0
    }
}

//O(1) O(n)
class TicTacToe {

    var p1Row: [Int]
    var p1Col: [Int]
    var p2Row: [Int]
    var p2Col: [Int]
    var p1Diagonal: Int = 0
    var p1AntiDiagonal: Int = 0
    var p2Diagonal: Int = 0
    var p2AntiDiagonal: Int = 0
    let n: Int
    init(_ n: Int) {
        p1Row = [Int](repeating: 0, count: n)
        p2Row = [Int](repeating: 0, count: n)
        p1Col = [Int](repeating: 0, count: n)
        p2Col = [Int](repeating: 0, count: n)
        self.n = n
    }
    
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        if player == 1 {
            p1Row[row] += 1
            if p1Row[row] == n {return 1}
            p1Col[col] += 1
            if p1Col[col] == n {return 1}
            if row == col {
                p1Diagonal += 1
                if p1Diagonal == n {return 1}
            }
            if row == n - 1 - col {
                p1AntiDiagonal += 1
                if p1AntiDiagonal == n {return 1}
            }
            
        } else {
            p2Row[row] += 1
            if p2Row[row] == n {return 2}
            p2Col[col] += 1
            if p2Col[col] == n {return 2}
            if row == col {
                p2Diagonal += 1
                if p2Diagonal == n {return 2}
            }
            if row == n - 1 - col {
                p2AntiDiagonal += 1
                if p2AntiDiagonal == n {return 2}
            }
        }
        return 0
    }
}