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

//O(n^2), O(n) TLE
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        if n <= 2 {return [Int](0..<n)}
        var graph = [Int:[Int]]()
        for edge in edges {
            graph[edge[0], default:[]].append(edge[1])
            graph[edge[1], default:[]].append(edge[0])
        }
        var treeHeigh = [Int: [Int]]()
        var minTreeHeigh = Int.max
        nextNode: for i in 0..<n {
            var queue = [i]
            var heigh = 0
            var seen = Set<Int>([i])
            while !queue.isEmpty {
                heigh += 1
                if heigh > minTreeHeigh {
                    continue nextNode
                }
                let temp = queue
                queue.removeAll()
                for node in temp {
                    for nei in graph[node, default:[]] {
                        if seen.contains(nei) == false {
                            seen.insert(nei)
                            queue.append(nei)
                        }
                    }    
                }
                
            }
            minTreeHeigh = min(minTreeHeigh, heigh) 
            treeHeigh[heigh, default:[]].append(i)
                
        }
        return treeHeigh[minTreeHeigh]!
    }