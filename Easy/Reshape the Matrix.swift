//Reshape the Matrix
//O(n), O(1)
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        let rows = mat.endIndex, cols = mat[0].endIndex
        if rows * cols > r * c {return mat}
        var res = (0..<r).map {_ in (0..<c).map {_ in 0 } }
        var i = 0, j = 0
        for row in mat {
            for item in row {
                res[i][j] = item
                j += 1
                if j == c {
                    j = 0
                    i += 1
                }
            }
        }
        if i != r || j != 0 {return mat}
        return res
    }
//O(n), O(1)
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        let rows = mat.endIndex, cols = mat[0].endIndex
        if rows*cols != r*c {return mat}
        var res = (0..<r).map {_ in (0..<c).map { _ in 0 }}
        for i in 0..<rows*cols {
            res[i/c][i%c] = mat[i/cols][i%cols]
        }
        return res
    }