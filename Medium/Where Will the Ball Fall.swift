//Where Will the Ball Fall
//O(n), O(1)
    func findBall(_ grid: [[Int]]) -> [Int] {
        var res = [Int]()
        let rows = grid.endIndex, cols = grid[0].endIndex
        next: for i in 0..<cols {
            var currRow = 0, currCol = i
            while currRow < rows {
                if grid[currRow][currCol] == 1 {
                    guard currCol + 1 < cols else {
                        res.append(-1)
                        continue next
                    }
                    if grid[currRow][currCol+1] == 1 {
                        currRow += 1
                        currCol += 1
                    } else {
                        res.append(-1)
                        continue next
                    }
                } else {
                    guard currCol-1 >= 0 else {
                        res.append(-1)
                        continue next
                    }
                    if grid[currRow][currCol-1] == -1 {
                        currRow += 1
                        currCol -= 1
                    } else {
                        res.append(-1)
                        continue next
                    }
                }
            }
            res.append(currCol)
        }
        return res
    }