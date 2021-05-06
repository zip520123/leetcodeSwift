//Best Meeting Point
//like shortestDistance from all buildings
//O(nm*buildings) O(nm) TLE
    func minTotalDistance(_ grid: [[Int]]) -> Int {
        var map = [[Int]:Int]()
        let rows = grid.endIndex, cols = grid[0].endIndex
        let shift = [0,1,0,-1,0]
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == 1 {
                    var queue = [[i,j]]
                    var seen = Set([[i,j]])
                    var level = 0
                    while !queue.isEmpty {
                        level += 1
                        let temp = queue
                        queue.removeAll()
                        for node in temp {
                            let x = node[0], y = node[1]
                            for k in 0..<4 {
                                let newX = x+shift[k], newY = y+shift[k+1]
                                guard newX >= 0, newX < rows, newY >= 0, newY < cols else {continue
                                    
                                }
                                if seen.contains([newX, newY]) == false {
                                    seen.insert([newX, newY])
                                    queue.append([newX,newY])
                                    map[[newX,newY], default: 0] += level
                                }
                            }
                        }
                    }
                    
                }
            }
        }
        var res = Int.max
        for i in 0..<rows {
            for j in 0..<cols {
                
                res = min(res, map[[i,j], default:Int.max])
            }
        }
        return res == Int.max ? -1 : res
    }
    //O(rows + cols log cols) get medium number
        func minTotalDistance(_ grid: [[Int]]) -> Int {
        var rows = [Int]()
        var cols = [Int]()
        for i in 0..<grid.endIndex {
            for j in 0..<grid[0].endIndex {
                if grid[i][j] == 1 {
                    rows.append(i)
                    cols.append(j)
                }
            }
        }
        cols.sort()
        let midCols = cols[cols.endIndex / 2]
        
        var d = 0
        for point in cols {
            d += abs(midCols - point)
        }
        let midRows = rows[rows.endIndex / 2]
        for point in rows {
            d += abs(midRows - point)
        }
        
        return d
    }