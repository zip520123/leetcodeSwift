//N-Queens
//Brute Force O(n^n)
class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var res = [[String]]()
        var mat = [[String]](repeating: [String](repeating: ".", count: n), count: n)
        
        let checkRight = checker(0,1)
        let checkLeft = checker(0,-1)
        let checkTop = checker(-1,0)
        let checkBottom = checker(1,0)
        let checkRightBottom = checker(1,1)
        let checkRightTop = checker(-1,1)
        let checkleftBottom = checker(1,-1)
        let checkleftTop = checker(-1,-1)
        
        func dfs(_ row: Int, _ currQ: Int) {
            if currQ == n {
                let currMatrix = mat.map { $0.joined() }
                res.append(currMatrix)
                return
            }
            var i = row
            while i < n {
                for j in 0..<n {
                    if mat[i][j] == "." {
                        if checkRight(mat,i,j) && checkLeft(mat,i,j) 
                        && checkBottom(mat,i,j) && checkTop(mat,i,j)
                        && checkRightBottom(mat,i,j) && checkRightTop(mat,i,j)
                        && checkleftBottom(mat,i,j) && checkleftTop(mat,i,j)
                        {
                            mat[i][j] = "Q"
                            dfs(i+1, currQ + 1)
                        }
                        mat[i][j] = "."
                    }
                }
                i += 1
            }
        }
        dfs(0,0)
        return res
    }
    func checker(_ dx: Int, _ dy: Int) -> ([[String]], Int, Int) -> Bool {
        func foo(_ matrix: [[String]], _ x: Int, _ y: Int) -> Bool {
            guard x >= 0, y >= 0, x < matrix.endIndex, y < matrix.endIndex else {
                return true
            }
            if matrix[x][y] == "Q" {return false}
            return foo(matrix, x+dx, y+dy)
        }
        return foo
    }
}
//O(n!) O(n)
    func solveNQueens(_ n: Int) -> [[String]] {
        var res = [[String]]()
        var queens = [Int](repeating: 0, count: n)
        var dales = [Int](repeating: 0, count: n*2-1)
        var hills = [Int](repeating: 0, count: n*2-1)
        var rows = [Int](repeating: 0, count: n)
        func dfs(_ row: Int) {
            for col in 0..<n {
                if isNotUnderAttack(row,col) {
                    placeQueen(row,col)
                    if row + 1 == n {
                        addSolution()
                    } else {
                        dfs(row+1)
                    }
                    removeQueen(row,col)
                }
            }
        }
        
        func isNotUnderAttack(_ x: Int, _ y: Int) -> Bool {
            return dales[x+y] + hills[x-y+n-1] + rows[y] == 0
        }
        
        func placeQueen(_ x:Int, _ y: Int) {
            queens[x] = y
            rows[y] = 1
            dales[x+y] = 1
            hills[x-y+n-1] = 1
        }
        
        func removeQueen(_ x:Int, _ y: Int) {
            queens[x] = 0
            rows[y] = 0
            dales[x+y] = 0
            hills[x-y+n-1] = 0
        }
        
        func addSolution() {
            var curr = [String]()
            for i in 0..<n {
                var s = ""
                let col = queens[i]
                for _ in 0..<col {
                    s += "."
                }
                s += "Q"
                for _ in col+1..<n {
                    s += "."
                }
                curr.append(s)
            }
            res.append(curr)
        }
        
        dfs(0)
        
        return res
    }