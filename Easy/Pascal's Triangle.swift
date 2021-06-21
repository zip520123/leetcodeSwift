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

    func generate(_ numRows: Int) -> [[Int]] {
        var res = (0..<numRows).map { n in (0...n).map{_ in 1} }
        
        for i in 1..<numRows {
            var n = 1 
            while n < i {
                res[i][n] = res[i-1][n] + res[i-1][n-1]    
                n += 1
            }
            
        }
        return res
    }