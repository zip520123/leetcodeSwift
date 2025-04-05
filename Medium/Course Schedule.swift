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

//O(n), O(n)
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var graph = [Int: Set<Int>]()
    var preCourses = [Int: [Int]]()
    var queue = [Int]()
    for prerequisite in prerequisites {
        graph[prerequisite[0], default: []].insert(prerequisite[1])
        preCourses[prerequisite[1], default: []].append(prerequisite[0])
    }
    for i in 0..<numCourses {
        if graph[i, default:[]].count == 0 {
            queue.append(i)
        }
    }
    
    while !queue.isEmpty {
        let temp = queue
        queue = []
        for node in temp {
            for preCourse in preCourses[node, default: []] {
                graph[preCourse, default: []].remove(node)
                if graph[preCourse, default: []].count == 0 {
                    queue.append(preCourse)
                }
            }
        }
    }
    for i in 0..<numCourses {
        if graph[i, default:[]].count > 0 {
            return false
        }
    }
    return queue.isEmpty

}

// O(n+e), O(n)
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var graph = [Int: [Int]]()
    var preCouresCount = [Int: Int]()
    for i in 0..<prerequisites.endIndex {
        let preCourse = prerequisites[i][1], course = prerequisites[i][0]
        graph[preCourse, default: []].append(course)
        preCouresCount[course, default: 0] += 1
    }
    var queue = [Int]()
    var completeCourses = 0
    for course in 0..<numCourses {
        if preCouresCount[course, default: 0] == 0 {
            queue.append(course)
            completeCourses += 1
        }
    }

    while !queue.isEmpty {
        let node = queue.removeFirst()
        for nextCourse in graph[node, default: []] {
            preCouresCount[nextCourse]! -= 1
            if preCouresCount[nextCourse]! == 0 {
                queue.append(nextCourse)
                completeCourses += 1
            }
        }
    }
    return completeCourses == numCourses
}

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var graph = [Int: [Int]]()
    
    for i in 0..<prerequisites.endIndex {
        let preCourse = prerequisites[i][1], course = prerequisites[i][0]
        graph[preCourse, default: []].append(course)
    }
    var visitList = [Int](repeating: 0, count: numCourses)
    // 0 non visit, 1 visiting, 2 visited
    func dfs(_ node: Int) -> Bool {
        if visitList[node] == 1 {
            return false
        }
        if visitList[node] == 2 {
            return true
        }
        visitList[node] = 1
        for nextNode in graph[node, default: []] {
            if dfs(nextNode) == false {
                return false
            }
        }
        visitList[node] = 2
        return true
    }
    for course in 0..<numCourses {
        if dfs(course) == false {
            return false
        }
    }
    return true
}