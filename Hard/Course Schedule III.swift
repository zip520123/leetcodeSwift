//Course Schedule III
//O(couses.len!) O(courses)
class Solution {
    func scheduleCourse(_ courses: [[Int]]) -> Int {
        var sorted = courses.sorted { a,b in a[1]<b[1] }
        var dict = [[Int]:Int]()
        func dfs(_ index: Int, _ time: Int) -> Int {
            if index == courses.endIndex {return 0}
            if dict[[index,time]] != nil {
                return dict[[index,time]]!
            }
            var taken = 0, notaken = 0
            for i in index..<sorted.endIndex {
                let currCourseDuration = sorted[index][0]
                let currCourseEndDate = sorted[index][1]
                if time + currCourseDuration <= currCourseEndDate {
                    taken = max(taken, 1 + dfs(i+1, time+currCourseDuration)) 
                }
                notaken = max(notaken, dfs(i+1, time))
            }
            dict[[index,time]] = max(taken, notaken)
            return dict[[index,time]]!
        }
        
        return dfs(0,0)
    }
}

//O(n log n) O(courses.len)
    func scheduleCourse(_ courses: [[Int]]) -> Int {
        var arr = courses.sorted { a,b in a[1]<b[1] }
        var time = 0
        var heap = [Int]()
        
        func find(_ target: Int) -> Int {
            var l = 0, r = heap.endIndex
            while l < r {
                let mid = (l+r)>>1
                if heap[mid] < target {
                    l = mid+1
                }else {
                    r = mid
                }
            }
            return l
        }
        
        func insert(_ target: Int) {
            let index = find(target)
            heap.insert(target, at:index)
        }
        
        for course in arr {
            if time+course[0] <= course[1] {
                time += course[0]
                insert(course[0])
            } else if !heap.isEmpty && heap.last! > course[0] {
                time = time - heap.last! + course[0]
                heap.removeLast()
                insert(course[0])
            }
        }
        return heap.count
    }