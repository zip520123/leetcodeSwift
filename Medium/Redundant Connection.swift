//Redundant Connection
//O(v+e), O(n)
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        var dict = [Int: Int]()
        for i in 1...edges.endIndex {
            dict[i] = i
        }
        func find(_ node: Int) -> Int {
            if dict[node]! == node {return node}
            dict[node] = find(dict[node]!)
            return dict[node]!
        }
        
        for edge in edges {
            let node1 = edge[0], node2 = edge[1]
            let root1 = find(node1), root2 = find(node2)
            if root1 == root2 {return edge}
            dict[root1] = root2
        }
        return []
    }