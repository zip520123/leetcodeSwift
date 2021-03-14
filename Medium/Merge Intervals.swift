/*Merge Intervals*/
//time O(n log n + n) space O(n)
func overlappings(_ item1:[Int], _ item2:[Int]) -> Bool {
    return item1[1] >= item2[0]
}

// func merge(_ intervals: [[Int]]) -> [[Int]] {
//     var res = [[Int]]()
//     var icount = intervals.count
//     var list = intervals.sorted {$0[0]<$1[0]}
//     while (list.isEmpty == false) {
//         var item = list.removeFirst()
//         var i = 0 
//         while (i < list.count) {
//             let item2 = list[i]
//             if overlappings(item,item2) {
//                 item[1] = max(item[1],item2[1])
//                 list.remove(at: i)
//             } else {
//                 i+=1
//             }
//         }
//         res.append(item)
//     }
//     return res
// }

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

let input = [[1,3],[2,6],[8,10],[15,18]]

print(merge(input))