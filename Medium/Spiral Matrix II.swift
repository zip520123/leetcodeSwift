/*Spiral Matrix II*/
    enum Direction {
        case right, top, bottom,left
    }
    func generateMatrix(_ n: Int) -> [[Int]] {
        var res = [[Int]](repeating: [Int](repeating:0, count: n), count: n)
        var left = 0, right = n - 1, top = 0, bottom = n - 1
        var d = Direction.right
        var curr = 1
        while left <= right && top <= bottom {
            switch d {
                case .right:
                    for i in left...right {
                        res[top][i] = curr
                        curr += 1
                    }
                    top += 1
                    d = .bottom
                case .bottom:
                    for i in top...bottom {
                        res[i][right] = curr
                        curr += 1
                    }
                    right -= 1
                    d = .left
                case .left:
                    for i in (left...right).reversed() {
                        res[bottom][i] = curr
                        curr += 1
                    }
                    bottom -= 1
                    d = .top
                case .top:
                    for i in (top...bottom).reversed() {
                        res[i][left] = curr
                        curr += 1
                    }
                    left += 1
                    d = .right
            }    
        }
        return res
    }