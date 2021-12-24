/*Merge Intervals*/

func merge(_ intervals: [[Int]]) -> [[Int]] {
    var res = [[Int]]()
    var list = intervals.sorted {$0[0]<$1[0]}
    res.append(list.removeFirst())
    
    for i in 0..<list.count {
        let item = list[i]
        let last = res.last!
        if item[0] <= last[1] {
            res.removeLast()
            res.append([last[0], max(item[1], last[1])])
        } else {
            res.append(item)
        }
    }
    return res
}

func merge(_ intervals: [[Int]]) -> [[Int]] {
    if intervals.endIndex <= 1 {
        return intervals
    }
    let sortedIntervals = intervals.sorted(by: {
        a,b in
        return a[0] < b[0]
    })
    var res = [[Int]]()
    var currInterval = sortedIntervals.first!
    var index = 1
    while index < intervals.endIndex {
        let rightInterval = sortedIntervals[index]
        if currInterval[1] < rightInterval[0] {
            res.append(currInterval)
            currInterval = rightInterval
        } else {
            currInterval[1] = max(currInterval[1], rightInterval[1])
        }
        index += 1
    }
    res.append(currInterval)
    return res
}

func merge(_ intervals: [[Int]]) -> [[Int]] {
    var sortedArr = intervals.sorted {
        a,b in
        if a[0] != b[0] {
            return a[0] < b[0]
        } else {
            return a[1] < b[1]
        }
    }
    
    var l = 0, r = 1
    while r < sortedArr.endIndex {
        if sortedArr[l][1] >= sortedArr[r][0] {
            sortedArr[l][1] = max(sortedArr[l][1],sortedArr[r][1])
            sortedArr.remove(at: r)
            
        } else {
            l = r
            r += 1
        }
    }
    return sortedArr
}

    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var sorted = intervals.sorted { a, b in  a[0] < b[0] }
        
        var l = 0, r = 1
        while r < sorted.endIndex {
            let left = sorted[l], right = sorted[r]
            if left[1] >= right[0] {
                sorted[l][1] = max(sorted[l][1], sorted[r][1])
                sorted.remove(at: r)
            } else {
                l = r
                r += 1
            }
        }
        return sorted
    }

//O(n log n), O(n)
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let arr = intervals.sorted(by: { a,b in
            return a[0] < b[0]
        })
        var res = [[Int]]()

        for curr in arr {
            if res.isEmpty {
                res.append(curr)
            } else {
                let last = res.last!
                if last[1] >= curr[0] {
                    res.removeLast()
                    res.append([last[0], max(curr[1], last[1])])
                } else {
                    res.append(curr)
                }
                
            }
        }
        return res
    }