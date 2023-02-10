//As Far from Land as Possible
//O(n^2), O(n)
    func maxDistance(_ grid: [[Int]]) -> Int {
        var lands = [[Int]]()
        let rows = grid.endIndex, cols = grid[0].endIndex
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == 1 {
                    lands.append([row,col])
                }
            }
        }
        var res = -1
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == 0 {
                    var curr = Int.max
                    let y1 = row, x1 = col

                    for land in lands {
                        let y0 = land[0], x0 = land[1]
                        
                        curr = min(curr, abs(x0-x1)+abs(y0-y1))
                    }
                    res = max(res, curr)
                }
            }
        }
        return res == Int.max ? -1 : res
    }