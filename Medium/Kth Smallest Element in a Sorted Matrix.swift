/*Kth Smallest Element in a Sorted Matrix*/
//O(log m * log n)
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        let row = matrix.endIndex, col = matrix[0].endIndex
        var left = matrix[0][0], right = matrix[row - 1][col - 1]
        
        func countN(_ n: Int) -> Int {
            var count = 0
            for row in matrix {
                var l = 0, r = col 
                while l < r {
                    let mid = (l+r) >> 1
                    if row[mid] <= n {
                        l = mid + 1
                    } else {
                        r = mid
                    }
                }
                count += l
            }
            return count
        }
        
        while left < right {
            let mid = (left + right) >> 1
            if countN(mid) < k {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }