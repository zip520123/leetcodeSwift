// Widest Vertical Area Between Two Points Containing No Points
// O(n log n), O(n)
func maxWidthOfVerticalArea(_ points: [[Int]]) -> Int {
    let arr = points.sorted { a, b in 
        return a[0] < b[0]
    }
    var res = 0
    for i in 1..<arr.endIndex {
        res = max(res, arr[i][0] - arr[i-1][0])
    }
    return res
}