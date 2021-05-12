//Making A Large Island
//O(n)
func largestIsland(_ grid: [[Int]]) -> Int {
        var islandId = 0
        var res = 0
        var grid = grid
        var dict = [[Int]:String]()
        let rows = grid.endIndex, cols = grid[0].endIndex
        let direct = [(0,1),(1,0),(-1,0),(0,-1)]
        var findIsland = false
        for i in 0..<rows {
            for j in 0..<cols {
                
                if grid[i][j] == 1 {
                    findIsland = true
                    var queue = [(i,j)]
                    var seen = Set<[Int]>()
                    while queue.isEmpty == false {
                        let (x,y) = queue.removeFirst()
                        grid[x][y] = 2
                        if seen.contains([x,y]) {
                            continue
                        }
                        for (dx,dy) in direct {
                            if x+dx < rows && x+dx >= 0 && y+dy < cols && y+dy >= 0 {
                                if grid[x+dx][y+dy] == 0 {
                                    grid[x+dx][y+dy] = -1
                                } else if grid[x+dx][y+dy] == 1 {
                                    queue.append((x+dx,y+dy))
                                }    
                            }
                        }
                        seen.insert([x,y])
                    }
                    
                    res = max(res,seen.count)
                    for point in seen {
                        let x = point[0], y = point[1]
                        dict[[x,y]] = "i_\(islandId)_\(seen.count)" 
                    }
                    islandId += 1
                }
                
            }
        }
        
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == -1 {
                    var adjacent = Set<String>()
                    for (dx,dy) in direct {
                        if i+dx < rows && i+dx >= 0 && j+dy < cols && j+dy >= 0 {
                            if dict[[i+dx,j+dy]] != nil {
                                adjacent.insert(dict[[i+dx,j+dy]]!)
                            }   
                        }
                    }
                    var curr = 0
                    for island in adjacent {
                        let n = Int(island.split(separator:"_")[2])!
                        curr += n
                    }
                    curr += 1
                    res = max(res, curr)
                }
            }
        }
        if findIsland == false {
            return 1
        }
        return res
    }


class Solution {
    func largestIsland(_ grid: [[Int]]) -> Int {
        var space = [[Int]]()
        let rows = grid.endIndex, cols = grid[0].endIndex
        var id = 0
        let direction = [0,1,0,-1,0]
        var cellToId = [[Int]:Int]()
        var idToCount = [Int:Int]()
        var res = 0
        var grid = grid
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == 0 {
                    space.append([i,j])
                } else if grid[i][j] == 1{
                    var count = 0
                    var queue = [[i,j]]
                    
                    while !queue.isEmpty {
                        let curr = queue.removeFirst()
                        let x = curr[0], y = curr[1]
                        grid[x][y] = -1
                        cellToId[[x,y]] = id
                        count += 1
                        for k in 0..<4 {
                            let newX = x + direction[k], newY = y + direction[k+1]
                            guard newX >= 0 && newX < rows && newY >= 0 && newY < cols && grid[newX][newY] == 1 else {continue}
                            grid[newX][newY] = -1
                            queue.append([newX,newY])
                        }
                    }
                    idToCount[id] = count
                    res = max(res, count)
                    id += 1
                }
            }
        }
    
        for item in space {
            let x = item[0], y = item[1]
            var idSet = Set<Int>()
            for k in 0..<4 {
                let newX = x + direction[k], newY = y + direction[k+1]
                guard newX >= 0 && newX < rows && newY >= 0 && newY < cols && grid[newX][newY] == -1 else {continue}
                idSet.insert(cellToId[[newX,newY]]!)
            }
            var count = 1
            for id in idSet {
                count += idToCount[id]!
            }
            res = max(res, count)
        }
        
        return res == 0 ? 1 : res   
    }
}