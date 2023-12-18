// Special Positions in a Binary Matrix
// O(n), O(1)
func numSpecial(_ mat: [[Int]]) -> Int {
    var res = 0
    let rows = mat.endIndex, cols = mat[0].endIndex
    for row in 0..<rows {
        if mat[row].reduce(0,+) == 1 {
            for col in 0..<cols {
                if mat[row][col] == 1 {
                    var curr = 0
                    for i in 0..<rows {
                        curr += mat[i][col]
                    }
                    if curr == 1 {
                        res += 1
                    }
                }
            }
        }
    }
    return res
}