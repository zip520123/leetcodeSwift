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