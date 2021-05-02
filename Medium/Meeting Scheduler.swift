//Meeting Scheduler
//O(s1 log s1 + s2 log s2) O(slots1+slots2)
    func minAvailableDuration(_ slots1: [[Int]], _ slots2: [[Int]], _ duration: Int) -> [Int] {
        var res = [Int]()
        let s1 = slots1.sorted { a,b in a[0] < b[0]}
        let s2 = slots2.sorted { a,b in a[0] < b[0]}
        var l = 0, r = 0
        while l < s1.endIndex && r < s2.endIndex {
            let currStart = max(s1[l][0],s2[r][0])
            let currEnd = min(s1[l][1],s2[r][1])
            if currEnd - currStart >= duration {
                res = [currStart, currStart + duration]
                return res
            }
            if s1[l][1] < s2[r][1] {
                l += 1
            } else {
                r += 1
            }
        }
        return []
    }