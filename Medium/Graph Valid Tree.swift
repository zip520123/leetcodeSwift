//Graph Valid Tree
//O(n) O(n) bfs detectCycle, detect non seen
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        var graph = [Int:[Int]]()
        for edge in edges {
            graph[edge[0],default:[]].append(edge[1])
            graph[edge[1],default:[]].append(edge[0])
        }
        
        var queue = [0]
        var currSeen = Set<Int>()
        while queue.isEmpty == false {
            let temp = queue
            queue.removeAll()
            for node in temp {
                if currSeen.contains(node) {
                    return false
                }
                currSeen.insert(node)
                for nei in graph[node,default:[]] {
                    if currSeen.contains(nei) == false {
                        queue.append(nei)
                    }
                }
            }
        }
        for node in 0..<n {
            if currSeen.contains(node) == false {
                return false
            }
        }
        return true
    }

    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        var graph = [Int:[Int]]()
        for edge in edges {
            graph[edge[0], default:[]].append(edge[1])
            graph[edge[1], default:[]].append(edge[0])
        }
        var queue = [0]
        var seen = Set<Int>()
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if seen.contains(node) {return false}
            seen.insert(node)
            for nei in graph[node,default:[]] {
                if seen.contains(nei) == false {
                    queue.append(nei)
                }
            }
        }
        for i in 0..<n {
            if seen.contains(i) == false {
                return false
            }
        }
        return true
    }

//O(N+E) O(N) Union find
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        var arr = [Int](0..<n)
        func find(_ node: Int) -> Int {
            if arr[node] == node {return arr[node]}
            arr[node] = find(arr[node])
            return arr[node]
        }
        
        for edge in edges {
            let root1 = find(edge[0])
            let root2 = find(edge[1])
            if root1 == root2 {
                return false
            }
            arr[root1] = root2
        }

        var set = Set<Int>()
        for node in arr {
            let root = find(node)
            set.insert(root)
        }
        
        return set.count == 1
    }

    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        var graph = [Int:Int]()
//         for i in 0..<n {
//             graph[i] = i
//         }
        
        func find(_ node: Int) -> Int {
            if graph[node, default: node] == node {return node}
            graph[node] = find(graph[node]!)
            return graph[node]!
        }
        
        for edge in edges {
            let root1 = find(edge[0]), root2 = find(edge[1])
            if root1 == root2 {return false}
            graph[root1] = root2
        }
        var set = Set<Int>()
        for i in 0..<n {
            set.insert(find(i))
        }
        return set.count == 1
    }