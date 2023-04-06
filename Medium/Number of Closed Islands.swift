//Number of Closed Islands
//O(n), O(n)
class Solution {
    func closedIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        let rows = grid.endIndex, cols = grid[0].endIndex
        var queue = [[Int]]()

        func bfs() {
            while !queue.isEmpty {
                let temp = queue
                queue.removeAll()
                for node in temp {
                    let x = node[0], y = node[1]
                    if x>=0 && x<rows && y>=0 && y<cols && grid[x][y] == 0 {
                        grid[x][y] = 1
                        queue.append([x+1,y])
                        queue.append([x-1,y])
                        queue.append([x,y+1])
                        queue.append([x,y-1])
                    }
                }
            }
        }

        for row in 0..<rows {
            if grid[row][0] == 0 {
                queue.append([row, 0])
            }
            if grid[row][cols-1] == 0 {
                queue.append([row, cols-1])
            }
            bfs()
        }

        for col in 0..<cols {
            if grid[0][col] == 0 {
                queue.append([0,col])
            }
            if grid[rows-1][col] == 0 {
                queue.append([rows-1,col])
            }
            bfs()
        }
        var res = 0
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == 0 {
                    res += 1
                    queue.append([row,col])
                    bfs()
                }

            }
        }
        return res    
    }
}

/*
[[1,1,1,1,1,1,1,0],
 [1,0,0,0,0,1,1,0],
 [1,0,1,0,1,1,1,0],
 [1,0,0,0,0,1,0,1],
 [1,1,1,1,1,1,1,0]]


*/