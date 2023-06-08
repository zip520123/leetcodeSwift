//Count Negative Numbers in a Sorted Matrix
//O(rows*cols), O(1)
    func countNegatives(_ grid: [[Int]]) -> Int {
        var res = 0
        for row in grid {
            for col in row {
                if col < 0 {
                    res += 1
                }
            }
        }
        return res
    }

//O(rows* log cols), O(1)
    func countNegatives(_ grid: [[Int]]) -> Int {
        var res = 0
        for row in grid {
            var l = 0,r = row.endIndex
            while l<r {
                let mid = l+(r-l)>>1
                if row[mid] >= 0 {
                    l = mid+1
                } else {
                    r = mid
                }
            }
            res += row.endIndex-l
        }
        return res
    }