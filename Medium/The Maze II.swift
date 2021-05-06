//The Maze II
//O(mn*max(m*n)) O(mn)
    func shortestDistance(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Int {
        
        var distance = [[Int]:Int]()
        let rows = maze.endIndex, cols = maze[0].endIndex
        let direction = [(0,1),(1,0),(-1,0),(0,-1)]
        
        var queue = [start]
        
        while queue.isEmpty == false {
            let currPosition = queue.removeFirst()
            for (dx, dy) in direction { 
                var newX = currPosition[0]
                var newY = currPosition[1]
                var currStep = 0
                while newX+dx >= 0 && newX+dx < rows 
                && newY+dy >= 0 && newY+dy < cols 
                && maze[newX+dx][newY+dy] == 0 {
                    newX += dx
                    newY += dy
                    currStep += 1
                }
                if distance[currPosition, default:0] + currStep < distance[[newX,newY], default:Int.max] {
                    distance[[newX, newY]] = distance[currPosition, default:0] + currStep
                    queue.append([newX, newY])
                }
            }
        }
        return distance[destination, default:-1]
    }