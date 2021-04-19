//Remove Covered Intervals
//O(n log n)
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        let sorted = intervals.sorted(by: {
            a,b in
            if a[0] != b[0] {
                return a[0] < b[0]
            } else {
                return a[1] > b[1]
            }
        })
        
        var ending = 0
        var res = 0
        for interval in sorted {
            if interval[1] > ending {
                res += 1
                ending = interval[1]
            }
        }
        return res
    }