//Meeting Rooms II
//O(n log n) O(n)
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        var timeline = Set<Int>()
        var currDict = [Int:Int]()
        for interval in intervals {
            let start = interval[0]
            let end = interval[1]
            currDict[start,default:0] += 1
            currDict[end, default:0] -= 1
            timeline.insert(start)
            timeline.insert(end)
        }
        let sortedTimeline = timeline.sorted()
        var res = 0
        var curr = 0
        for time in sortedTimeline {
            curr += currDict[time,default:0]
            res = max(res,curr)
        }
        return res
    }

//O(n log n) O(n)
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        var dict = [Int:Int]()
        
        for interval in intervals {
            dict[interval[0],default:0] += 1
            dict[interval[1],default:0] -= 1
        }
        let timeline = dict.keys.sorted()
        var curr = 0
        var res = 0
        for t in timeline {
            curr += dict[t]!
            res = max(curr,res)
        }
        return res
    }