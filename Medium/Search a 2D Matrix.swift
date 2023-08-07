/*Search a 2D Matrix*/
//O(m+n) O(1)
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let row = matrix.endIndex
        let col = matrix[0].endIndex
        var x = row - 1, y = 0
        while x >= 0 && x < row && y >= 0 && y < col {
            if matrix[x][y] == target {
                return true
            } else if matrix[x][y] < target {
                y += 1
            } else {
                x -= 1
            }
        }
        return false
    }

//O(rows+log col), O(1)
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var row = matrix.endIndex-1
        while row > 0 && target < matrix[row][0] {
            row -= 1
        }
        
        var l = 0, r = matrix[row].endIndex-1
        while l<r {
            let mid = l+(r-l)>>1
            if matrix[row][mid] < target {
                l = mid+1
            } else {
                r = mid
            }
        }
        return matrix[row][l] == target
    }

// O(log (rows * cols)), O(1)
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rows = matrix.endIndex, cols = matrix[0].endIndex
        let n = rows*cols
        var l = 0, r = n-1
        while l<r {
            let mid = l+((r-l)>>1)
            let row = mid / cols
            let col = mid % cols
            if matrix[row][col] < target {
                l = mid + 1
            } else  {
                r = mid
            }

        }
        let row = l/cols
        let col = l%cols
        return matrix[row][col] == target
    }