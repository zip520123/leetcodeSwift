// Maximum Matrix Sum
// O(n), O(1)
func maxMatrixSum(_ matrix: [[Int]]) -> Int {
    let rows = matrix.endIndex, cols = matrix.endIndex
    var has_zero = false
    var min_postive = Int.max
    var max_nagative = Int.min
    var res = 0
    var nagative_count = 0
    for row in 0..<rows {
        for col in 0..<cols {
            let n = matrix[row][col]
            if n < 0 {
                nagative_count += 1
                max_nagative = max(max_nagative, n)
                res -= n
            } else if n == 0 {
                has_zero = true
            } else {
                min_postive  = min(min_postive, n)
                res += n
            }
        }
    }
    if nagative_count % 2 == 1, has_zero == false {
        res -= min(abs(max_nagative), min_postive) * 2
    }
    return res
}