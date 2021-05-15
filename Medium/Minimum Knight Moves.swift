//Minimum Knight Moves
//BFS TLE
    func minKnightMoves(_ x: Int, _ y: Int) -> Int {
        var level = 0
        var queue = [(0,0)]
        let direction = [(-1,-2),(-2,-1),(-2,1),(-1,2),(1,2),(2,1),(1,-2),(2,-1)]
        var seen = Set<[Int]>()
        seen.insert([0,0])
        while !queue.isEmpty {
            let temp = queue
            queue.removeAll() 
            
            for (row,col) in temp {
                if row == x && col == y {
                    return level
                }
                for (dx, dy) in direction {
                    let newX = row+dx, newY = col+dy
                    if seen.contains([newX, newY]) == false {
                       seen.insert([newX, newY])
                        queue.append((newX, newY))
                    }
                    
                }
            }
            level += 1
        }
        return -1
    }

//
    func minKnightMoves(_ x: Int, _ y: Int) -> Int {
        var dict = [[Int]:Int]()
        func dfs(_ row:Int, _ col: Int) -> Int {
            if dict[[row,col]] != nil {
                return dict[[row, col]]!
            }
            if (row+col==0) {
                return 0
            } else if (row+col==2) {
                return 2
            } else {
                let res = min(dfs(abs(row-1), abs(col-2)), dfs(abs(row-2), abs(col-1))) + 1
                dict[[row,col]] = res
                return res
            }
            
        }
        return dfs(abs(x), abs(y))
    }