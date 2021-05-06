//Longest Line of Consecutive One in Matrix
//O(mat*4) O(mat*4)
    func longestLine(_ mat: [[Int]]) -> Int {
        var res = 0
        var dict = [[Int]:[Int]]()
        let rows = mat.endIndex, cols = mat[0].endIndex
        let shift = [(-1,0),(-1,-1),(0,-1),(-1,1)]
        for i in 0..<rows {
            for j in 0..<cols {
                var curr = [Int]()
                let val = mat[i][j]
                dict[[i,j]] = [val,val,val,val]
                res = max(res, val)
                if val == 1 {
                    for (k,(dx, dy)) in shift.enumerated() {
                    let newX = i+dx, newY = j+dy
                        guard newX >= 0 && newY >= 0 && newY < cols else {
                            curr.append(mat[i][j])
                            continue
                        }
                        let currCount = dict[[newX,newY]]![k] + mat[i][j]
                        res = max(res, currCount)
                        curr.append(currCount)
                    }

                    dict[[i,j]] = curr
                }
            }
        }
        return res
    }