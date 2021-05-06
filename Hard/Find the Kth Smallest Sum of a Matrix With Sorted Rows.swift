//Find the Kth Smallest Sum of a Matrix With Sorted Rows
//O(k* n log n) n is rows
    func kthSmallest(_ mat: [[Int]], _ k: Int) -> Int {
        var arr = mat[0]
        let rows = mat.endIndex, cols = mat[0].endIndex
        var i = 1
        while i < rows {
            var nextRow = [Int]()
            for j in 0..<cols {
                for n in arr {
                    nextRow.append(mat[i][j]+n)    
                }
            }
            nextRow.sort()
            arr = Array(nextRow[0..<(min(k, nextRow.endIndex))])
            i += 1
        }
        return arr[k-1]
    }