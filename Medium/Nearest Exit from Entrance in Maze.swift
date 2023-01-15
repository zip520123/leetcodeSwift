//Nearest Exit from Entrance in Maze
//O(n), O(n)
    func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        var seen = Set<[Int]>()
        var queue = [entrance]
        seen.insert(entrance)
        var step = 0
        let rows = maze.endIndex, cols = maze[0].endIndex
        while !queue.isEmpty {
            let arr = queue
            queue.removeAll()
            
            for p in arr {
                let row = p[0], col = p[1]
                if (row == 0 || row == rows-1 || col == 0 || col == cols-1) && entrance != p {
                    return step 
                }
                if row+1 < rows && maze[row+1][col] == "." && seen.contains([row+1, col]) == false {
                    queue.append([row+1, col])
                    seen.insert([row+1, col])
                }
                if row-1 >= 0 && maze[row-1][col] == "." && seen.contains([row-1, col]) == false {
                    queue.append([row-1, col])
                    seen.insert([row-1,col])
                }
                if col+1 < cols && maze[row][col+1] == "." && seen.contains([row, col+1]) == false {
                    queue.append([row, col+1])
                    seen.insert([row, col+1])
                }
                if col-1 >= 0 && maze[row][col-1] == "." && seen.contains([row, col-1]) == false {
                    queue.append([row, col-1])
                    seen.insert([row, col-1])
                }
            }
            step += 1
        }
        return -1
    }