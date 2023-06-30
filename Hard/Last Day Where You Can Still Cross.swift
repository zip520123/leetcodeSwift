// Last Day Where You Can Still Cross
// O(n log n), O(n)
func latestDayToCross(_ row: Int, _ col: Int, _ cells: [[Int]]) -> Int {
    func canCross(_ day: Int) -> Bool {
        var grid = [[Int]](repeating: [Int](repeating: 0, count: col), count: row)
        for cell in cells[...day] {
            let r = cell[0], c = cell[1]
            grid[r-1][c-1] = 1
        }
        var queue: [(Int,Int)] = []
        for i in 0..<col {
            if grid[0][i] == 0 {
                queue.append((0,i))
                grid[0][i] = 1
            }
        }
        while !queue.isEmpty {
            let (r,c) = queue.removeFirst()
            if r == row-1 {return true}
            for (dr, dc) in [(0,1),(1,0),(-1,0),(0,-1)] {
                let nextRow = r+dr, nextCol = c+dc
                if nextRow >= 0 && nextRow < row &&
                    nextCol >= 0 && nextCol < col && grid[nextRow][nextCol] == 0 {
                        grid[nextRow][nextCol] = 1
                        queue.append((nextRow, nextCol))
                    }
            }
        }
        return false
    }

    var l = 1, r = row*col
    while l<r {
        let mid = l+((r-l)>>1)
        if canCross(mid) {
            l = mid+1
        } else {
            r = mid
        }
    }
    return l
}