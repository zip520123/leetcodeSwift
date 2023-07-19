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
/*
if two intervals are overlapping, 
we want to remove the interval that has the longer end point -- 
the longer interval will always overlap with more or the same number of future intervals compared to the shorter one
*/
        func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        var sorted = intervals.sorted {a, b in 
                                       if a[0] != b[0] {
                                           return a[0] < b[0]
                                       } else {
                                           return a[1] < b[1]
                                       }}
        var l = 0, r = 1
        var res = 0
        while r < sorted.endIndex {
            if sorted[l][1] > sorted[r][0] {
                res += 1
                if sorted[l][1] < sorted[r][1] {
                    r += 1
                } else {
                    l = r
                    r += 1
                }
            } else {
                l = r
                r += 1    
            }
            
        }
        return res
    }

//O(n), O(1)
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let arr = intervals.sorted { a,b in 
            return a[0] < b[0]
        }
        
        var l = 0, r = 1, res = 0
        while r < arr.endIndex {
            if arr[l][1] <= arr[r][0] {
                l = r
            } else {
                res += 1
                if arr[l][1] > arr[r][1] {
                    l = r
                }
            }
            r += 1
        }
        return res
    }