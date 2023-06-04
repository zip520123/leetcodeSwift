//Number of Provinces
//O(n), O(n)
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        var graph = [Int: Int]()
        let n = isConnected.endIndex
        func find(_ node: Int) -> Int {
            if graph[node] == nil {
                graph[node] = node
                return graph[node]!
            }
            if graph[node] != node {
                graph[node] = find(graph[node]!) 
            }
            return graph[node]!
        }
        func union(_ node1: Int, _ node2: Int) {
            let root1 = find(node1), root2 = find(node2)
            graph[root1] = root2
        }
        for i in 0..<n {
            for j in 0..<n {
                let node1 = i
                let node2 = j
                if isConnected[i][j] == 1 {
                    union(node1, node2)
                }
            }
        }
        var set = Set<Int>()
        for node in 0..<n {
            set.insert(find(node))
        }
        return set.count
    }