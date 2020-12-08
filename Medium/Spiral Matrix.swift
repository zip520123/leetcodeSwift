/*Spiral Matrix*/
enum Direction {
        case top
        case left
        case right
        case bottom
    }
//time O(n) space O(2n)
func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var res = [Int]()
    let row = matrix.count
    let col = matrix[0].count
    var seen = Array(repeating: Array(repeating: false, count: col), count: row)
    
    var i = 0, j = 0
    var d = Direction.right
    for _ in 0..<row*col {
        res.append(matrix[i][j])
        seen[i][j] = true
        switch d {
            case .top:
                if i-1 >= 0 && seen[i - 1][j] == false {
                    i -= 1
                } else {
                    d = .right
                    j += 1
                }
            case .left:
                if j-1 >= 0 && seen[i][j-1] == false {
                    j -= 1
                } else {
                    d = .top
                    i -= 1
                    
                }
            case .right:
                if j+1 < col && seen[i][j+1] == false{
                    j += 1    
                } else {
                    d = .bottom
                    i += 1
                }
            case .bottom:
                if i+1 < row && seen[i+1][j] == false {
                    i += 1
                } else {
                    d = .left
                    j -= 1
                }
        }
        
    }
    
    return res
}