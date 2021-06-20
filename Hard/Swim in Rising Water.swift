//Swim in Rising Water
//O(n^2 * log n), O(n^2)
    func swimInWater(_ grid: [[Int]]) -> Int {
        let rows = grid.endIndex, cols = grid[0].endIndex
        var dict = [[Int]:[Int]]()
        for i in 0..<rows {
            for j in 0..<cols {
                dict[[i,j]] = [i,j]
            }
        }
        func find(_ p: [Int]) -> [Int] {
            if dict[p]! == p {return p}
            dict[p] = find(dict[p]!)
            return dict[p]!
        }
        func union(_ p1:[Int], _ p2:[Int]) {
            let root1 = find(p1), root2 = find(p2)
            dict[root1] = root2
        }
        var events = [[Int]]()
    
        for i in 0..<rows {
            for j in 0..<cols {
                events.append([grid[i][j],i,j])
            }
        }
        events.sort { a, b in a[0] < b[0] } // O(n^2 * log n)
        
        let direction = [0,1,0,-1,0]
        for curr in events { //O(n^2)
            let value = curr[0], x = curr[1], y = curr[2]
            for k in 0..<4 {
                let dx = x+direction[k], dy = y+direction[k+1]
                if dx >= 0 && dx < rows && dy >= 0 && dy < cols {
                    if grid[dx][dy] < value {
                        union([x,y],[dx,dy])
                    }
                    if find([0,0]) == find([rows-1,cols-1]) {
                        return value
                    }
                }
                
            }

        }
        return -1
    }