//Parallel Courses
//O(N+E) O(N+E) BFS
class Solution {
    func minimumSemesters(_ n: Int, _ relations: [[Int]]) -> Int {
        var arr = [Int](repeating: 0, count: n+1)
        var graph = [Int:[Int]]()
        for relat in relations {
            let p1 = relat[0], p2 = relat[1]
            graph[p1, default:[]].append(p2)
            arr[p2] += 1
        }
        var queue = [Int]()
        for course in 1...n {
            if arr[course] == 0 {
                queue.append(course)
            }
        }
        var semester = 0
        while queue.isEmpty == false {
            let temp = queue
            queue.removeAll()
            semester += 1
            for course in temp {
                for neighbor in graph[course, default:[]] {
                    arr[neighbor] -= 1
                    if arr[neighbor] == 0 {
                        queue.append(neighbor)
                    }
                }    
            }
        }
        for n in arr {
            if n > 0 {
                return -1
            }
        }
        return semester
    }
}

class Solution {
    func minimumSemesters(_ n: Int, _ relations: [[Int]]) -> Int {
        var graph = [Int:[Int]]()
        for relate in relations {
            let p1 = relate[0], p2 = relate[1]
            graph[p1, default:[]].append(p2)
        }
        var depth = [Int](repeating:1, count: n+1)
        var visitState = [Int](repeating: 0, count: n+1)
        
        func dfs(_ node: Int) -> Bool {
            if visitState[node] == -1 {return false}
            if visitState[node] == 1 {return true}
            visitState[node] = -1
            for nei in graph[node,default:[]] {
                if dfs(nei) == false {return false}
                depth[node] = max(depth[node], depth[nei] + 1)
            }
            visitState[node] = 1
            return true
        }
        
        for node in 1...n {
            if dfs(node) == false {
                return -1
            }
        }
        
        return depth.max()!
    }
}