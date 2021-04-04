/*Range Addition II*/
//brute force O(m*n*x) space O(m*n)
    func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
        let row = m
        let col = n
        var matrix = [[Int]](repeating: [Int](repeating:0, count:n), count: m)
        var max = 0
        
        for op in ops {
            for y in 0..<op[1] {
                for x in 0..<op[0] {
                    matrix[y][x] += 1
                    max = Swift.max(matrix[y][x], max)
                }
            }
        }
        
        var res = 0
        for i in 0..<row {
            for j in 0..<col {
                if matrix[i][j] == max {
                    res += 1
                }
            }
        }
        return res
    }
//time O(x) space O(1)
    func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
        var row = m
        var col = n
        for op in ops {
            row = min(row,op[0])
            col = min(col,op[1])
        }
        
        return row * col
    }