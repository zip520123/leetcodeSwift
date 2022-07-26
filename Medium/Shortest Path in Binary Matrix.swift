//Shortest Path in Binary Matrix
//O(n), O(n)
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        if grid[0][0] == 1 {return -1}
        var seen = Set<[Int]>()
        let rows = grid.endIndex, cols = grid[0].endIndex
        if rows == 1, cols == 1 {return 1}
        var queue = [[0,0]]
        var steps = 1
        seen.insert([0,0])
        while !queue.isEmpty {
            steps += 1
            let temp = queue
            queue.removeAll()
            for curr in temp {
                let x = curr[0], y = curr[1]
                for dx in [-1,0,1] {
                    for dy in [-1,0,1] {
                        let nextX = dx+x, nextY = dy+y
                        guard nextX>=0, nextX<rows, nextY>=0, nextY<cols, grid[nextX][nextY] == 0 else {continue}
                        if seen.contains([nextX, nextY]) {continue}
                        if nextX == rows-1, nextY == cols-1 {return steps}
                        seen.insert([nextX, nextY])
                        queue.append([nextX, nextY])
                    }
                }
            }
        }
        return -1
    }