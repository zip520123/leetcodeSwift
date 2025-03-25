// Count Days Without Meetings
// O(nlogn) time | O(n) space
func countDays(_ days: Int, _ meetings: [[Int]]) -> Int {
    let sorted_meetings = meetings.sorted { a,b in 
        a[0] < b[0]
    }
    var arr = [[Int]]()
    for i in 0..<sorted_meetings.endIndex {
        if arr.endIndex == 0 {
            arr.append(sorted_meetings[i])
        } else if arr.last![1] >= sorted_meetings[i][0] {
            let last = arr.removeLast()
            arr.append([last[0], max(last[1], sorted_meetings[i][1])])
        } else {
            arr.append(sorted_meetings[i])
        }
    }
    
    var start = 1
    var days_without_meetings = 0
    for i in 0..<arr.endIndex {
        let gap = arr[i][0] - start
        days_without_meetings += gap
        start = arr[i][1] + 1
    }
    days_without_meetings += days - start + 1
    return days_without_meetings
}