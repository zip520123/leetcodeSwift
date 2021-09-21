//Find Winner on a Tic Tac Toe Game
//O(n), O(1)
    func tictactoe(_ moves: [[Int]]) -> String {
        var rows = [["A":0,"B":0],["A":0,"B":0],["A":0,"B":0]]
        var cols = [["A":0,"B":0],["A":0,"B":0],["A":0,"B":0]]
        var topRbottomL = ["A":0,"B":0]
        var topLbottomR = ["A":0,"B":0]
        var curr = "A"
        for move in moves {
            let row = move[0], col = move[1]
            rows[row][curr]! += 1
            cols[col][curr]! += 1
            if row == col {topRbottomL[curr]! += 1}
            if row == 3-1-col {topLbottomR[curr]! += 1}
            
            if rows[row][curr]! == 3 {return curr}
            if cols[col][curr]! == 3 {return curr}
            if topRbottomL[curr]! == 3 {return curr}
            if topLbottomR[curr]! == 3 {return curr}
            
            curr = curr == "A" ? "B" : "A"
        }
        return moves.endIndex < 9 ? "Pending" : "Draw"
    }