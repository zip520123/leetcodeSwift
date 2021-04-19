//K Closest Points to Origin
//O(n log n) O(n)
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        let sorted = points.sorted(by: {
            a,b in
            return (a[0] * a[0] + a[1] * a[1]) < (b[0] * b[0] + b[1] * b[1])
        })
        return Array(sorted[0..<k])
    }