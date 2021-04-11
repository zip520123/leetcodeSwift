//Course Schedule II
//O(n^2) O(n)
func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var arr = [Int](repeating: 0, count: numCourses)
    var res = [Int]()
    for prereq in prerequisites {
            arr[prereq[0]] += 1
    }
    var queue = [Int]()
    for (i,n) in arr.enumerated() {
        if n == 0 {
            queue.append(i)
            res.append(i)
        }
    }
    while queue.isEmpty == false {
        let course = queue.removeFirst()
        for prereq in prerequisites {
            if prereq[1] == course {
                arr[prereq[0]] -= 1
                if arr[prereq[0]] == 0 {
                    res.append(prereq[0])
                    queue.append(prereq[0])
                }
            }
        }
    }
    for n in arr {
        if n > 0 {
            return []
        }
    }
    return res
}
//O(n^2)
func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        
    var dict = [Int:Int]()
    var res = [Int]()
    for prereq in prerequisites {
            dict[prereq[0],default:0] += 1
    }
    var queue = [Int]()
    for i in 0..<numCourses {
        if dict[i, default:0] == 0 {
            queue.append(i)
            res.append(i)
        }
    }
    
    while queue.isEmpty == false {
        let course = queue.removeFirst()
        for prereq in prerequisites {
            if prereq[1] == course {
                dict[prereq[0]]! -= 1
                if dict[prereq[0]]! == 0 {
                    res.append(prereq[0])
                    queue.append(prereq[0])
                }
            } 
        }
        
    }
    for i in 0..<numCourses {
        if dict[i, default:0] > 0 {
            return []
        }
    }
    return res
}