//Cherry Pickup II
//O(row*col*col), O(row*col*col), TLE
    func cherryPickup(_ grid: [[Int]]) -> Int {
        var dict = [[Int]: Int]()
        let rows = grid.endIndex, cols = grid[0].endIndex
        func dfs(_ row: Int, _ col1: Int, _ col2: Int) -> Int {
            if dict[[row,col1,col2]] != nil {return dict[[row,col1,col2]]!}
            guard col1>=0, col1<cols, col2>=0, col2<cols else {return -1}
            var res = grid[row][col1]    
            if col1 != col2 {
                res += grid[row][col2]
            }
            var curr = 0
            if row < rows-1 {
                for newCol1 in col1-1...col1+1 {
                    for newCol2 in col2-1...col2+1 {
                        curr = max(curr, dfs(row+1, newCol1, newCol2))
                    }
                }    
                res += curr
            }
            dict[[row, col1, col2]] = res
            return res
            
        }
        return dfs(0,0,cols-1)
    }

//bottom up
//O(rows*col*col), O(row*col*col)
    func cherryPickup(_ grid: [[Int]]) -> Int {
        var dict = [[Int]: Int]()
        let rows = grid.endIndex, cols = grid[0].endIndex
        for row in (0..<rows).reversed() {
            for col1 in 0..<cols {
                for col2 in 0..<cols {
                    var res = grid[row][col1]
                    if col1 != col2 {
                        res += grid[row][col2]
                    }
                    
                    if row != rows-1 {
                        var curr = Int.min
                        for newCol1 in col1-1...col1+1 where newCol1 >= 0 && newCol1 < cols {
                            for newCol2 in col2-1...col2+1 where newCol2 >= 0 && newCol2 < cols {
                                curr = max(curr, dict[[row+1,newCol1,newCol2]]! )        
                            }
                        }
                        res += curr
                    }
                    dict[[row,col1,col2]] = res
                }
            }
        }
        return dict[[0,0,cols-1]]!
    }

// O(rows*cols*cols), O(rows*cols*cols)
func cherryPickup(_ grid: [[Int]]) -> Int {
    let rows = grid.endIndex, cols = grid[0].endIndex
    var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: cols), count: cols), count: rows)
    func dfs(_ row: Int, _ col1: Int, _ col2: Int) -> Int {
        guard col1 >= 0, col1 < cols, col2 >= 0, col2 < cols else { return 0 }
        if dp[row][col1][col2] != -1 {
            return dp[row][col1][col2]
        }
        var res = grid[row][col1] + grid[row][col2]
        if col1 == col2 {
            res -= grid[row][col1]
        }
        if row == rows-1 {
            dp[row][col1][col2] = res
            return res
        }
        var curr = 0
        for a in col1-1...col1+1 {
            for b in col2-1...col2+1 {
                curr = max(curr, dfs(row+1, a, b))
            }
        }
        res += curr
        dp[row][col1][col2] = res
        return res
    }
    return dfs(0, 0, cols-1)
}

// O(rows*cols*cols), O(rows*cols*cols)
func cherryPickup(_ grid: [[Int]]) -> Int {
    let rows = grid.endIndex, cols = grid[0].endIndex
    var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: cols), count: cols), count: rows)
    for col1 in 0..<cols {
        for col2 in 0..<cols {
            var curr = grid[rows-1][col1] + grid[rows-1][col2]
            if col1 == col2 {
                curr -= grid[rows-1][col1]
            }
            dp[rows-1][col1][col2] = curr
        }
    }
    for row in (0..<rows-1).reversed() {
        for col1 in 0..<cols {
            for col2 in 0..<cols {
                var curr = grid[row][col1] + grid[row][col2]
                if col1 == col2 {
                    curr -= grid[row][col1]
                }
                var res = 0
                for a in col1-1...col1+1 {
                    for b in col2-1...col2+1 {
                        if a >= 0, a<cols, b>=0, b<cols {
                            res = max(res, dp[row+1][a][b])
                        }
                    }
                }
                dp[row][col1][col2] = res + curr
            }
        }
    }
    return dp[0][0][cols-1]
}