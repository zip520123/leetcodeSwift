//Find if Path Exists in Graph
//O(n), O(n)
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var dict = [Int: [Int]]()
        for edge in edges {
            let a = edge[0], b = edge[1]
            dict[a, default: []].append(b)
            dict[b, default: []].append(a)
        }
        var queue = [source]
        var seen = Set<Int>([source])
        while !queue.isEmpty {
            let temp = queue
            queue.removeAll()
            for node in temp {
                if node == destination {
                    return true
                }
                for next in dict[node, default:[]] {
                    if seen.contains(next) == false {
                        seen.insert(next)
                        queue.append(next)
                    }
                }
            }
        }
        return false
    }