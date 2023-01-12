//Number of Nodes in the Sub-Tree With the Same Label
//O(n), O(n)
    func countSubTrees(_ n: Int, _ edges: [[Int]], _ labels: String) -> [Int] {
        var graph = [Int: [Int]]()
        for edge in edges {
            graph[edge[0], default: []].append(edge[1])
            graph[edge[1], default: []].append(edge[0])
        }
        
        let arr = Array(labels)
        var res = (0..<n).map{ _ in 0 }
        func dfs(_ node: Int, _ parent: Int) -> [Character: Int] {
            var curr = [Character: Int]()
            for subNode in graph[node, default: []] {
                if subNode == parent {continue}
                let dict = dfs(subNode, node)
                for (key, val) in dict {
                    curr[key, default: 0] += val
                }
            }
            curr[arr[node], default: 0] += 1
            res[node] = curr[arr[node]]!
            return curr
        }
        
        dfs(0, -1) 
        return res
    }