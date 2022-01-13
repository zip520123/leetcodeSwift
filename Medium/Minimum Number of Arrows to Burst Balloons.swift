//Minimum Number of Arrows to Burst Balloons
//O(n log n), O(n)
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        var res = points.endIndex
        let arr = points.sorted { a,b in a[0]<b[0] }
        var curr = arr[0]
        for i in 1..<arr.endIndex {
            if curr[1] >= arr[i][0] {
                res -= 1
                curr = [arr[i][0], min(arr[i][1], curr[1])]
            } else {
                curr = arr[i]
            }
        }
        return res
    }