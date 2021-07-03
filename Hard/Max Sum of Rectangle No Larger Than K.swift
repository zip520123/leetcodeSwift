//Max Sum of Rectangle No Larger Than K
//O(m*n^3), O(n)
    func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
        var res = Int.min
        let rows = matrix.endIndex, cols = matrix[0].endIndex
        for i in 0..<cols {
            var arr = (0..<rows).map{_ in 0}
            for j in i..<cols {
                for row in 0..<rows {
                    arr[row] += matrix[row][j]
                }
                res = max(prefixSum(arr, k), res) 
            }
        }
        return res
    }
    
    func prefixSum(_ arr:[Int], _ k: Int) -> Int {
        var res = Int.min
        for i in 0..<arr.endIndex {
            var sum = 0
            for j in i..<arr.endIndex {
                sum += arr[j]
                if sum <= k {
                    res = max(res, sum)
                }
            }
        }
        return res
    }