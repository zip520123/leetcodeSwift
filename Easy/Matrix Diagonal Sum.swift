//Matrix Diagonal Sum
//O(n), O(1)
    func diagonalSum(_ mat: [[Int]]) -> Int {
        var res = 0
        var i = 0
        let n = mat.endIndex-1
        while i<mat.endIndex {
            res += mat[i][i]
            res += mat[i][n-i] 
            if i == n-i {res -= mat[i][n-i] }           
            i += 1
        }
        return res
    }