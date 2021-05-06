//Minimum Height Trees
//O(N+E) O(N)
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        if n < 2 { return [Int](0..<n) }
        var remainNodes = n
        var graph = [Int:Set<Int>]()
        for edge in edges {
            graph[edge[0], default:[]].insert(edge[1])
            graph[edge[1], default:[]].insert(edge[0])
        }
        var leaves = [Int]()
        for node in 0..<n {
            if graph[node, default:[]].count == 1 {
                leaves.append(node)
            }
        }
        while remainNodes > 2 {
            remainNodes -= leaves.endIndex
            let currLeaves = leaves
            leaves.removeAll()
            for leaf in currLeaves {
                let neighbor = graph[leaf]!.first!
                graph[neighbor]!.remove(leaf)
                if graph[neighbor]!.count == 1 {
                    leaves.append(neighbor)
                }
            }
            
        }
        return leaves
    }
