//Interval List Intersections
//O(n log n) O(firstList + secondList)
func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        var timeline = [Int]()
        var leftStart = Set<Int>(), leftEnd = Set<Int>()
        var rightStart = Set<Int>(), rightEnd = Set<Int>()
        for interval in firstList {
            leftStart.insert(interval[0])
            leftEnd.insert(interval[1])
            timeline.append(interval[0])
            timeline.append(interval[1])
        }
        for interval in secondList {
            rightStart.insert(interval[0])
            rightEnd.insert(interval[1])
            timeline.append(interval[0])
            timeline.append(interval[1])
        }
        let sortedTimeline = timeline.sorted()
        var leftState = false, rightState = false
        var startPoint = 0
        var res = [[Int]]()
        for time in sortedTimeline {
            if leftStart.contains(time) {
                if rightState == true {
                    startPoint = time
                }
                leftState = true
            }
            if rightStart.contains(time) {
                if leftState == true {
                    startPoint = time
                }
                rightState = true
            }
            
            if leftEnd.contains(time) {
                if leftState && rightState {
                    res.append([startPoint, time])
                }
                leftState = false
            }
            if rightEnd.contains(time) {
                if leftState && rightState {
                    res.append([startPoint, time])
                }
                rightState = false
            }
        }
        return res
    }
//O(m+n)
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        var res = [[Int]]()
        var i = 0, j = 0
        while i < firstList.endIndex && j < secondList.endIndex {
            let left = firstList[i], right = secondList[j]
            let low = max(left[0],right[0])
            let high = min(left[1],right[1])
            if low <= high {
                res.append([low,high])
            }
            if left[1] < right[1] {
                i += 1
            } else {
                j += 1
            }
        }
        return res
    }