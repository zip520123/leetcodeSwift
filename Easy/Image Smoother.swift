// Image Smoother
// O(n), O(n)
func imageSmoother(_ img: [[Int]]) -> [[Int]] {
    let rows = img.endIndex, cols = img[0].endIndex
    var res = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
    for row in 0..<rows {
        for col in 0..<cols {
            var curr = 0, count = 0
            for x in [-1,0,1] {
                for y in [-1,0,1] {
                    if row+y >= 0 && row+y < rows && col+x >= 0 && col+x < cols {
                        curr += img[row+y][col+x]
                        count += 1
                    }
                }
            }
            res[row][col] = curr / count
        }
    }
    return res
}