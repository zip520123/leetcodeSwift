//Pascal's Triangle
    func generate(_ numRows: Int) -> [[Int]] {
        var res = [[Int]]()
        for i in 0..<numRows {
            var row = [Int]()
            for j in 0...i {
                if j == 0 || j == i {
                    row.append(1)
                } else {
                    let prev = res[i-1]
                    row.append(prev[j-1] + prev[j])
                }
            }
            res.append(row)
            
        }
        return res
    }