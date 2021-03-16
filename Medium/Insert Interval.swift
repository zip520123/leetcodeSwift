/*Insert Interval*/
//time O(n) space O(n)
func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        
    let icount = intervals.count
    if icount == 0 {
        return [newInterval]
    }
    var res = [[Int]]()
    if newInterval[1] < intervals[0][0] {
        res.append(newInterval)
        res += intervals
        return res
    }
    
    for (i, item) in intervals.enumerated() {
        if item[1] >= newInterval[0] {
            if item[0] > newInterval[1] {
                res.append(newInterval)
                res.append(item)
            } else {
                res.append([min(item[0],newInterval[0]),max(item[1],newInterval[1])])    
            }
            
            for j in i..<icount {
                let prev = res.last!
                let curr = intervals[j]
                if prev[1] >= curr[0] {
                    res.removeLast()
                    res.append([prev[0], max(curr[1],prev[1])])
                } else {
                    res.append(curr)
                }
            }
            break
        } else {
            res.append(item)
        }
    }
    
    if res.last![1] < newInterval[0] {
        res.append(newInterval)
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
let input = [[1,3],[6,9]]
let input2 = [2,5]
print(insert(input, input2))