//Is Graph Bipartite?
//O(N+E) O(N) where N is the number of nodes in the graph, and E is the number of edges.
    func isBipartite(_ graph: [[Int]]) -> Bool {
        var color = [Int](repeating: -1, count: graph.endIndex)
        for node in 0..<graph.endIndex {
            if color[node] == -1 {
                color[node] = 1
                var stack = [node]
                
                while stack.isEmpty == false {
                    let currNode = stack.removeLast()
                    let currColor = color[currNode]
                    for adjacentNode in graph[currNode] {
                        if color[adjacentNode] == -1 {
                            color[adjacentNode] = currColor ^ 1
                            stack.append(adjacentNode)
                        } else if color[adjacentNode] != currColor ^ 1 {
                            return false
                        }
                    }
                }
            }
        }
        return true
    }