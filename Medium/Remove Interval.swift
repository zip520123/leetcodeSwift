// Remove Interval
// O(n log n), O(n)
    func removeInterval(_ intervals: [[Int]], _ toBeRemoved: [Int]) -> [[Int]] {
        var mergedIntervals = [[Int]]()
        var arr = (intervals + [toBeRemoved]).sorted { a,b in a[0]<b[0]}

        for i in 0..<arr.endIndex {
            let interval = arr[i]
            if !mergedIntervals.isEmpty, mergedIntervals.last![1] >= interval[0] {
                mergedIntervals[mergedIntervals.endIndex-1][1] = max(mergedIntervals.last![1], interval[1])
            } else {
                mergedIntervals.append(interval)
            }
        }

        var res = [[Int]]()
        for interval in mergedIntervals {
            if interval[0] <= toBeRemoved[0], toBeRemoved[1] <= interval[1] {
                if interval[0] < toBeRemoved[0] {
                    res.append([interval[0], toBeRemoved[0]])
                }
                if toBeRemoved[1] < interval[1] {
                    res.append([toBeRemoved[1], interval[1]])
                }
            } else {
                res.append(interval)
            }
            
        }
        return res
    }

// O(n), O(1)
    func removeInterval(_ intervals: [[Int]], _ toBeRemoved: [Int]) -> [[Int]] {
        var res = [[Int]]()
        let removeStart = toBeRemoved[0], removeEnd = toBeRemoved[1]
        for interval in intervals {
            if interval[1] < removeStart || removeEnd < interval[0] {
                res.append(interval)
            } else {
                if interval[0] < removeStart {
                    res.append([interval[0], removeStart])
                }
                if removeEnd < interval[1] {
                    res.append([removeEnd, interval[1]])
                }
            }
        }
        return res
    }