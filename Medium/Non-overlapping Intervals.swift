/*Non-overlapping Intervals*/
func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    var left = 0, right = 1
    var count = 0
    let intervalsCount = intervals.count
    let sortedIntervals = intervals.sorted(by: {
        a,b in
        if a[0] != b[0] {
            return a[0] < b[0]
        } else {
            return a[1] < b[1]
        }
    })
    
    while right < intervalsCount {
        let leftIntervals = sortedIntervals[left]
        let rightIntervals = sortedIntervals[right]
        if leftIntervals[1] <= rightIntervals[0] {
            left = right
            right += 1
        } else {
            if leftIntervals[1] < rightIntervals[1] {
                right += 1
                count += 1
            } else {   
                left = right
                right += 1
                count += 1
            }
        }
    }
    return count
}

func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        
        let sorted = intervals.sorted {
            a,b in
            if a[0] != b[0]{
                return a[0] < b[0]
            } else {
                return a[1] < b[1]
            }}
        var left = 0, right = 1
        var count = 0
        while right < sorted.endIndex {
            if sorted[left][1] <= sorted[right][0] {
                left = right
                right += 1
            } else {
                count += 1
                if sorted[left][1] < sorted[right][1] {
                    right += 1
                } else {
                    left = right
                    right += 1
                }
            }
        }
        return count
    }