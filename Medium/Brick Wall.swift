//Brick Wall
//O(wall.rows * wall.cols) O(wall)
    func leastBricks(_ wall: [[Int]]) -> Int {
        var res = Int.max
        var wall = wall
        let weight = wall[0].reduce(0,+)
        var rowsIndex = [Int](repeating: 0, count: wall.endIndex)
        var i = 0
        while i < weight {
            var curr = 0
            for j in 0..<wall.endIndex {
                let rowIndex = rowsIndex[j]
                wall[j][rowIndex] -= 1
                
                if wall[j][rowIndex] == -1 {
                    rowsIndex[j] += 1
                } else {
                    curr += 1
                }
                
            }
            res = min(res,curr)
            i += 1
        }
        
        return res
    }
//O(bricks length) O(bricks length)
    func leastBricks(_ wall: [[Int]]) -> Int {
        var dict = [Int: Int]()
        wall.forEach { row in
            var gapPosition = 0 
            for i in 0..<row.endIndex - 1 {
                gapPosition += row[i]
                dict[gapPosition,default:0] += 1
            }
        }
        
        var count = 0
        for (_,currCount) in dict {
            if currCount > count {
                count = currCount
            }
        }
        return wall.endIndex - count
    }