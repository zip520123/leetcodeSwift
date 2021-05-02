//The Maze
//O(mn) O(mn)
    func hasPath(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Bool {
        var visited = Set<[Int]>()
        let rows = maze.endIndex, cols = maze[0].endIndex
        func dfs(_ x: Int, _ y: Int) -> Bool {
            if x < 0 || x == rows || y < 0 || y == cols {return false}
            visited.insert([x,y])
            if [x,y] == destination {return true}
            var res = false
            var leftY = y
            while leftY - 1 >= 0 && maze[x][leftY-1] == 0 {
                leftY -= 1
            }
            if visited.contains([x,leftY]) == false {
                res = res || dfs(x,leftY)
            }
            var rightY = y
            while rightY + 1 < cols && maze[x][rightY+1] == 0 {
                rightY += 1
            }
            if visited.contains([x,rightY]) == false {
                res = res || dfs(x,rightY)
            }
            var upX = x
            while upX-1 >= 0 && maze[upX-1][y] == 0 {
                upX -= 1
            }
            if visited.contains([upX,y]) == false {
                res = res || dfs(upX,y)
            }
            var downX = x
            while downX+1 < rows && maze[downX+1][y] == 0 {
                downX += 1
            }
            if visited.contains([downX,y]) == false {
                res = res || dfs(downX,y)
            }
            return res
        }
        return dfs(start[0],start[1])
    }

//refactor DFS
    func hasPath(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Bool {
        var visited = Set<[Int]>()
        let rows = maze.endIndex, cols = maze[0].endIndex
        let direction = [(0,1),(1,0),(-1,0),(0,-1)]
        func dfs(_ x: Int, _ y: Int) -> Bool {
            if x < 0 || x == rows || y < 0 || y == cols {return false}
            if visited.contains([x,y]) {return false}
            visited.insert([x,y])
            if [x,y] == destination {return true}
            
            for (dx, dy) in direction {
                var newX = x, newY = y
                while newX+dx >= 0 && newX+dx < rows && newY+dy >= 0 && newY+dy < cols && maze[newX+dx][newY+dy] == 0 {
                    newX += dx
                    newY += dy
                }
                
                if dfs(newX,newY) {
                    return true
                }
            }
            
            return false
        }
        return dfs(start[0],start[1])
    }

//BFS
    func hasPath(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Bool {
        var visited = Set<[Int]>()
        let rows = maze.endIndex, cols = maze[0].endIndex
        let direction = [(0,1),(1,0),(-1,0),(0,-1)]
        
        var queue = [start]
        
        while queue.isEmpty == false {
            let curr = queue.removeFirst()
            
            if curr == destination {return true}
            for (dx, dy) in direction {
                var newX = curr[0], newY = curr[1]
                while newX+dx >= 0 && newX+dx < rows && newY+dy >= 0 && newY+dy < cols && maze[newX+dx][newY+dy] == 0 {
                    newX += dx
                    newY += dy
                }
                if visited.contains([newX,newY]) == false {
                    visited.insert([newX,newY])
                    queue.append([newX,newY])    
                }
            }
        }
        return false
    }