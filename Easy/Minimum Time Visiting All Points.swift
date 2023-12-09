// Minimum Time Visiting All Points
// O(n), O(1)
func minTimeToVisitAllPoints(_ points: [[Int]]) -> Int {
    var res = 0
    for i in 1..<points.endIndex {
        let p1 = points[i-1], p2 = points[i]
        res += max(abs(p1[0]-p2[0]), abs(p1[1]-p2[1]))
    }
    return res
}