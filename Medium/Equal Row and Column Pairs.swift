// Equal Row and Column Pairs
//O(rows*cols), O(rows+cols)
class Solution {
    func equalPairs(_ grid: [[Int]]) -> Int {
        var res = 0
        let rows = grid.endIndex, cols = grid[0].endIndex
        for i in 0..<rows {
            let arr1 = grid[i]
            for j in 0..<cols {
                var arr2 = [Int]()
                for k in 0..<rows {
                    arr2.append(grid[k][j])
                }
                if equArr(arr1, arr2) {
                    res += 1
                }
            }
        }
        return res
    }

    func equArr(_ arr1: [Int], _ arr2: [Int]) -> Bool {
        if arr1.endIndex != arr2.endIndex {return false}
        for (n1,n2) in zip(arr1,arr2) {
            if n1 != n2 {
                return false
            }
        }
        return true
    }
}