//All Paths From Source to Target
//O(n), O(n)
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        let target = graph.endIndex-1
        var res = [[Int]]()
        
        var queue = [[0]]
        while !queue.isEmpty {
            let path = queue.removeFirst()
            let curr = path.last!
            if curr == target {
                res.append(path)
                continue
            }
            for next in graph[curr] {
                queue.append(path + [next])
            }   
        }
        return res
    }

//DFS O(n), O(n)
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var res = [[Int]]()
        var dict = [Int: [Int]]()
        for (i, edge) in graph.enumerated() {
            dict[i] = edge
        }
        
        let target = graph.endIndex-1
        
        func dfs(_ curr: [Int], _ node: Int) {
            if node == target {
                res.append(curr)
                return
            }    
            for next in dict[node, default:[]] {
                dfs(curr+[next], next)
            }
        }
        dfs([0],0)
        return res
    }