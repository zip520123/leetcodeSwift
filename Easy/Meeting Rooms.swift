//Meeting Rooms
//O(n log n) O(n)
class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        var sorted = intervals.sorted { a, b in
            a[0] < b[0]
        }
        var i = 0
        while i < sorted.endIndex - 1 {
            let t1 = sorted[i], t2 = sorted[i+1]
            if t1[1] > t2[0] {return false}
            i += 1
        }
        return true
    }
}