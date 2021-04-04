/*Search a 2D Matrix II*/
//O(m+n) O(1)
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let row = matrix.endIndex
        let col = matrix[0].endIndex
        var x = row - 1, y = 0
        while x >= 0 && x < row && y >= 0 && y < col {
            if matrix[x][y] == target {
                return true
            } else if matrix[x][y] > target {
                x -= 1
            } else {
                y += 1 
            }
        }
        return false
    }