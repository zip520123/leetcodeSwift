//Number of Connected Components in an Undirected Graph
//O(N+E)
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var graph = [Int:[Int]]()
        
        for edge in edges {
            graph[edge[0],default:[]] += [edge[1]]
            graph[edge[1],default:[]] += [edge[0]]
        }
        var res = 0
        var seen = Set<Int>()
        for node in 0..<n {
            if seen.contains(node) == false {
                res += 1
                var queue = [node]
                
                while queue.isEmpty == false {
                    let curr = queue.removeFirst()
                    seen.insert(curr)
                    for nei in graph[curr,default:[]] {
                        if seen.contains(nei) == false {
                            queue.append(nei)
                        }
                    }
                    
                }
            }
        }
        
        return res
    }

    //Union find O(Edges) O(nodes)
class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var arr = [Int](0..<n)
        
        func union(_ p1: Int, _ p2: Int) {
            let v1 = find(p1)
            let v2 = find(p2)
            arr[v1] = v2
        }
        
        func find(_ p: Int) -> Int {
            if arr[p] == p {
                return arr[p]
            }
            arr[p] = find(arr[p])
            return arr[p]
        }
        
        for edge in edges {
            union(edge[0],edge[1])
        }
        var set = Set<Int>()
        for i in 0..<n {
            set.insert(find(i))
        }
        return set.count
    }
}

class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var arr = [Int](0..<n)
        var count = n
        func find(_ p: Int) -> Int {
            if arr[p] == p {return p}
            arr[p] = find(arr[p])
            return arr[p]
        }
        
        func union(_ p1: Int, _ p2: Int) {
            let root1 = find(p1)
            let root2 = find(p2)
            if root1 != root2 {
                count -= 1
            }
            arr[root1] = root2
        }
        var set = Set<Int>()
        for edge in edges {
            union(edge[0],edge[1])
        }
        
        return count
    }
}