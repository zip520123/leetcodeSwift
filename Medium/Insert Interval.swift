/*Insert Interval*/
//time O(n) space O(n)
func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        if intervals.endIndex == 0 {return [newInterval]}
        if newInterval[1] < intervals[0][0] {
            return [newInterval] + intervals
        }
        if newInterval[0] > intervals.last![1] {
            return intervals + [newInterval]
        }
        
        var res = [[Int]]()

        for (i,item) in intervals.enumerated() {
            if newInterval[0] <= item[1] {
                if newInterval[1] < item[0] {
                    res.append(newInterval)
                    res.append(item)
                } else {
                    res.append([min(item[0],newInterval[0]),max(item[1],newInterval[1])])    
                }
                for j in i+1..<intervals.endIndex {
                    let curr = intervals[j]
                    let prev = res.last!
                    if curr[0] <= prev[1] {
                        res.removeLast()
                        res.append([prev[0],max(curr[1],prev[1])])
                    } else {
                        res.append(curr)
                    }
                }
                break
            } else {
                res.append(item)
            }
        }
        
        return res
    }

//time O(n log n) space O(n)
func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    let inter = (intervals + [newInterval]).sorted(by:{ 
        a,b in
        if a[0] != b[0] {
            return a[0] < b[0]
        } else {
            return a[1] < b[1]
        }
    })

    var res = [[Int]]()
    var curr = inter[0]
    
    for i in 1..<inter.endIndex {
        let next = inter[i]
        if curr[1] >= next[0] {
            curr[1] = max(curr[1],next[1])
        }else {
            res.append(curr)
            curr = next
        }
    }
    res.append(curr)
    
    return res
}

//O(n log n), O(n)
func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    let arr = (intervals + [newInterval]).sorted(by: { a, b in
        return a[0] < b[0]
    })
    var res = [arr[0]]
    
    for i in 1..<arr.endIndex {
        let prev = res.last!
        let curr = arr[i]
        if curr[0] <= prev[1] {
            var last = res.removeLast()
            last[1] = max(last[1], curr[1])
            res.append(last)
        } else {
            res.append(curr)
        }
    }
    
    return res
    
}

//time O(n) space O(n)
func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var intervals = intervals
    if intervals.endIndex == 0 {return [newInterval]}
    if newInterval[1] < intervals[0][0] {
        return [newInterval] + intervals 
    }
    if newInterval[0] > intervals[intervals.endIndex - 1][1] {
        return intervals + [newInterval]
    }
    
    var i = 0
    
    while i < intervals.endIndex {
        if intervals[i][1] >= newInterval[0] {
            if newInterval[1] < intervals[i][0]{
                intervals.insert(newInterval, at:i)
                break
            } else {
                intervals[i][1] = max(intervals[i][1],newInterval[1])
                intervals[i][0] = min(intervals[i][0],newInterval[0])
                var r = i+1
                while r < intervals.endIndex {
                    if intervals[i][1] >= intervals[r][0] {
                        intervals[i][1] = max(intervals[i][1],intervals[r][1])
                        intervals.remove(at:r)
                    } else {
                        i = r
                        r += 1
                    }
                }    
            }
            
        } 
        i += 1
    }
    
    return intervals
}

let input = [[1,3],[6,9]]
let input2 = [2,5]
print(insert(input, input2))