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

//O(m+n) O(1)
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rows = matrix.endIndex, cols = matrix[0].endIndex
        var row = 0, col = cols-1
        while row < rows, col >= 0 {
            if matrix[row][col] < target {
                row+=1
            } else if matrix[row][col] > target {
                col-=1
            } else {
                return true
            }
        }
        return false
    }