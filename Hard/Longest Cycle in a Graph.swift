//Longest Cycle in a Graph
//O(n), O(n)
    func longestCycle(_ edges: [Int]) -> Int {
        var dict = [Int: Int]()
        var nextToNode = [Int: Set<Int>]()
        for (i,n) in edges.enumerated() {
            dict[i] = n
            nextToNode[n, default:[]].insert(i)
        }

        var queue = [Int]()
        for i in 0..<edges.endIndex {
            if nextToNode[i, default:[]].count == 0 {
                queue.append(i)
            }
        }

        while !queue.isEmpty {
            let temp = queue
            queue.removeAll()
            for node in temp {
                if let dest = dict[node] {
                    nextToNode[dest]?.remove(node)
                    dict[node] = nil
                    if let set = nextToNode[dest], set.count == 0 {
                        queue.append(dest)
                    }
                }
                
            }
        }
        var res = -1, seen = Set<Int>()
        for i in 0..<edges.endIndex {
            let root = i
            var step = 0
            var bfs = [root]
            while !bfs.isEmpty {
                let temp = bfs
                bfs.removeAll()
                step += 1
                for node in temp {
                    if seen.contains(node) {
                        continue
                    }
                    seen.insert(node)
                    if let next = dict[node] {
                        if next == root {
                            res = max(res, step)
                        }
                        bfs.append(next)
                    }
                }
            }
        }
        return res

    }