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

//O(n log n), O(n)
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        var res = 1
        let arr = points.sorted { a,b in a[1]<b[1] }
        var prev = arr[0]
        for i in 1..<arr.endIndex {
            let curr = arr[i]
            if prev[1] < curr[0] {
                res += 1
                prev = curr
            }
        }
        return res
    }

// O(n log n), O(n)
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        let arr = points.sorted { a, b in a[0]<b[0] }
        var res = points.endIndex
        var curr = arr[0][1]
        for i in 1..<points.endIndex {
            if curr >= arr[i][0] {
                res -= 1
                curr = min(curr, arr[i][1])
            } else {
                curr = arr[i][1]
            }
        }
        return res
    }