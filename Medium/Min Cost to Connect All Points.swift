//Min Cost to Connect All Points
//O(n^2 log n), O(n^2)
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        var paths = [(node1: Int, node2: Int, wei: Int)]()
        for (i,point) in points.enumerated() {
            let node1x = point[0], node1y = point[1]
            for j in i+1..<points.endIndex {
                let node2 = points[j]
                let node2x = node2[0], node2y = node2[1]
                let wei = abs(node1x-node2x) + abs(node1y-node2y)
                paths.append((i,j,wei))
            }
        }
        
        paths.sort { a,b in a.wei < b.wei }
        
        var graph = [Int: Int]()
        for i in 0..<points.endIndex {
            graph[i] = i
        }
        
        func find(_ node: Int) -> Int {
            if graph[node]! == node {return node}
            graph[node] = find(graph[node]!)
            return graph[node]!
        }
        
        var edge = 0, i = 0, res = 0
        
        while edge < points.endIndex-1 {
            let (node1, node2, wei) = paths[i]
            let root1 = find(node1)
            let root2 = find(node2)
            if root1 != root2 {
                edge += 1
                res += wei
                graph[root1] = root2
            }
            i += 1
        }
        
        return res
    }