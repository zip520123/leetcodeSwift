//Leftmost Column with at Least a One
//O(log cols * rows)
    func leftMostColumnWithOne(_ matrix: BinaryMatrix) -> Int {
        let dimensions = matrix.dimensions()
		let (rows, cols) = (dimensions[0], dimensions[1])
        var res = Int.max
        
        for row in 0..<rows {
            var l = 0, r = cols - 1
            while l < r {
                let mid = (l+r)>>1
                if matrix.get(row, mid) == 0 {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            if matrix.get(row,l) == 1 && l < res {
                res = l
            }
        }
        return res == Int.max ? -1 : res
    }
//O(cols + rows)
    func leftMostColumnWithOne(_ matrix: BinaryMatrix) -> Int {
        let dimensions = matrix.dimensions()
		let (rows, cols) = (dimensions[0], dimensions[1])
        var res = Int.max
        var row = 0, col = cols - 1
        while row < rows && col >= 0 {
            if matrix.get(row,col) == 1 {
                res = col
                col -= 1
            } else {
                row += 1
            }
        }
        return res == Int.max ? -1 : res
    }

    func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
        let matrix = binaryMatrix.dimensions()
		let rows = matrix[0], cols = matrix[1]
        var x = 0, y = cols-1
        while x < rows && y >= 0 {
            if binaryMatrix.get(x,y) == 0 {
                x += 1
            } else {
                y -= 1
            }
        }
        return y == cols-1 ? -1 : y+1
    }