// Minimum Obstacle Removal to Reach Corner
// O(n), O(n)
func minimumObstacles(_ grid: [[Int]]) -> Int {
    let rows = grid.endIndex, cols = grid[0].endIndex
    var dp = [[Int]](repeating: [Int](repeating: Int.max, count: cols), count: rows)
    dp[0][0] = 0
    var deque = [[0,0]]
    while !deque.isEmpty {
        let node = deque.removeFirst()
        let row = node[0], col = node[1]
        for (d_row, d_col) in [(0,1),(1,0),(-1,0),(0,-1)] {
            let next_row = row+d_row, next_col = col+d_col
            if 0 <= next_row, next_row < rows, 0 <= next_col, next_col < cols {
                if dp[row][col] + grid[next_row][next_col] < dp[next_row][next_col] {
                    dp[next_row][next_col] = dp[row][col] + grid[next_row][next_col]
                    if grid[next_row][next_col] == 1 {
                        deque.append([next_row, next_col])
                    } else {
                        deque.insert([next_row, next_col], at: 0)
                    }
                }
            }
        }
    }
    return dp[rows-1][cols-1]
}