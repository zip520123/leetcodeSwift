//N-Queens II
//O(n!) O(n)
    func totalNQueens(_ n: Int) -> Int {
        var queens = [Int](repeating: 0, count: n)
        var cols = [Int](repeating: 0, count: n)
        var dales = [Int](repeating: 0, count: n*2-1)
        var hills = [Int](repeating: 0, count: n*2-1)
        var res = 0
        func dfs(_ row: Int) {
            for col in 0..<n {
                if isNotUnderAttack(row,col) {
                    placeQueen(row,col)
                    
                    if row + 1 == n {
                        res += 1
                    } else {
                        dfs(row+1)
                    }
                    removeQueen(row,col)
                } 
            }
        }
        func placeQueen(_ x:Int, _ y:Int) {
            queens[x] = y
            cols[y] = 1
            dales[x+y] = 1
            hills[x-y+n-1] = 1
        }
        func removeQueen(_ x:Int,_ y:Int) {
            queens[x] = 0
            cols[y] = 0
            dales[x+y] = 0
            hills[x-y+n-1] = 0
        }
        func isNotUnderAttack(_ x:Int, _ y: Int) -> Bool {
            return cols[y] + dales[x+y] + hills[x-y+n-1] == 0
        }
        dfs(0)
        return res
    }