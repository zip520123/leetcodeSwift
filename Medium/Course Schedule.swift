/*Course Schedule*/
//time O(n^2) space O(n)
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    
    var arr = Array<Int>(repeating: 0, count: numCourses)
    
    for item in prerequisites {
        arr[item[0]] += 1
    }
    var queue = [Int]()
    for (i,item) in arr.enumerated() {
        if item == 0 {
            queue.append(i)
        } 
    }
    
    while (queue.isEmpty == false) {
        let index = queue.removeFirst()
        for item in prerequisites {
            if item[1] == index {
                arr[item[0]] -= 1
                if arr[item[0]] == 0 {
                    queue.append(item[0])
                }
            }
        }
    }
    
    for item in arr {
        if item > 0 {
            return false
        }
    }
    return true
}

//O(n+e), O(n), n = courses.len, e = edges.len 
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph = [Int:[Int]]()
        var counts = [Int:Int]()
        for pre in prerequisites {
            graph[pre[1], default:[]].append(pre[0])
            counts[pre[0], default:0] += 1
        }
        var queue = [Int]()
        for i in 0..<numCourses {
            if counts[i,default:0] == 0 {
                queue.append(i)
            }
        }
        
        while !queue.isEmpty {
            let course = queue.removeFirst()
            for nei in graph[course, default:[]] {
                counts[nei, default:0] -= 1
                if counts[nei] == 0 {
                    queue.append(nei)
                }
            } 
        }
        
        for (_, val) in counts {
            if val > 0 {return false}
        }
        return true
    }