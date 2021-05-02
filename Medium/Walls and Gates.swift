//Walls and Gates
//O(m*n) O(m*n) TLE
    func wallsAndGates(_ rooms: inout [[Int]]) {
        let rows = rooms.endIndex, cols = rooms[0].endIndex
        
        func dfs(_ x:Int, _ y:Int, _ path: Int) {
            if x < 0 || y < 0 || x == rows || y == cols || rooms[x][y] < path {return}
            rooms[x][y] = path
            dfs(x+1,y,path+1)
            dfs(x-1,y,path+1)
            dfs(x,y+1,path+1)
            dfs(x,y-1,path+1)
        }
        
        for i in 0..<rows {
            for j in 0..<cols {
                if rooms[i][j] == 0 {dfs(i,j, 0)}
            }
        }
    }
//O(m*n) O(m*n) bfs
    func wallsAndGates(_ rooms: inout [[Int]]) {
        let rows = rooms.endIndex, cols = rooms[0].endIndex
        
        var queue = [(Int,Int)]()
        
        for i in 0..<rows {
            for j in 0..<cols {
                if rooms[i][j] == 0 {
                    queue.append((i,j))
                }
            }
        }
        
        while queue.isEmpty == false {
            let temp = queue
            queue.removeAll()
            for (x,y) in temp {
                let curr = rooms[x][y]
                if x+1 < rows && rooms[x+1][y] > curr {
                    rooms[x+1][y] = curr + 1
                    queue.append((x+1,y))
                }
                if x-1 >= 0 && rooms[x-1][y] > curr {
                    rooms[x-1][y] = curr + 1
                    queue.append((x-1,y))
                }
                if y+1 < cols && rooms[x][y+1] > curr {
                    rooms[x][y+1] = curr + 1
                    queue.append((x,y+1))
                }
                if y-1 >= 0 && rooms[x][y-1] > curr {
                    rooms[x][y-1] = curr + 1
                    queue.append((x,y-1))
                }
            }
        }
        
    }

//O(m*n) O(m*n) eliminate duplicate fill
    func wallsAndGates(_ rooms: inout [[Int]]) {
        let rows = rooms.endIndex, cols = rooms[0].endIndex
        
        var queue = [(Int,Int)]()
        
        for i in 0..<rows {
            for j in 0..<cols {
                if rooms[i][j] == 0 {
                    queue.append((i,j))
                }
            }
        }
        let d = [(0,1),(1,0),(-1,0),(0,-1)]
        while queue.isEmpty == false {
            let temp = queue
            queue.removeAll()
            for (x,y) in temp {
                let curr = rooms[x][y]
                for (dx,dy) in d {
                    if x+dx < 0 || x+dx == rows || y+dy < 0 || y+dy == cols || rooms[x+dx][y+dy] != 2147483647 {
                        continue
                    }
                    rooms[x+dx][y+dy] = curr + 1
                    queue.append((x+dx,y+dy))
                }
            }
        }
    }