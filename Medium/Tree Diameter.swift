//Tree Diameter
//O(n^2) O(edges)
    func treeDiameter(_ edges: [[Int]]) -> Int {
        var path = 0
        var graph = [Int:[Int]]()
        for edge in edges {
            graph[edge[0], default:[]].append(edge[1])
            graph[edge[1], default:[]].append(edge[0])
        }
        for node in 0...edges.endIndex {
            var seen = Set<Int>()
            var queue = [node]
            var currPath = 0
            while queue.isEmpty == false {
                let temp = queue
                queue.removeAll()
                currPath += 1
                for curr in temp {
                    seen.insert(curr)
                    for nei in graph[curr, default: []] {
                        if seen.contains(nei) == false {
                            queue.append(nei)
                        }
                    }
                }
            }
            path = max(currPath - 1, path)
        }
        return path
    }

//O(n) O(n) find Farthest Nodes via BFS and use it search again
    func treeDiameter(_ edges: [[Int]]) -> Int {
        
        var graph = [Int:[Int]]()
        for edge in edges {
            graph[edge[0], default:[]].append(edge[1])
            graph[edge[1], default:[]].append(edge[0])
        }
        
        func bfs(_ node: Int) -> (Int, [Int]) {
            var queue = [node]
            var preQueue = [Int]()
            var seen = Set<Int>()
            var path = 0
            while !queue.isEmpty {
                path += 1
                preQueue = queue
                queue.removeAll()
                for node in preQueue {
                    seen.insert(node)
                    for nei in graph[node, default:[]] {
                        if seen.contains(nei) == false {
                            queue.append(nei)
                        }
                    }
                }
            }
            return (path, preQueue)
        }
        
        let (_, endNodes) = bfs(0)
        let (path, _) = bfs(endNodes[0])
        
        return path - 1
    }

    //O(n) O(n) remove leaves
    func treeDiameter(_ edges: [[Int]]) -> Int {
        
        var graph = [Int:Set<Int>]()
        for edge in edges {
            graph[edge[0], default:[]].insert(edge[1])
            graph[edge[1], default:[]].insert(edge[0])
        }
        var remainNodes = edges.endIndex + 1
        var layers = 0
        var leaves = [Int]()
        for node in 0...edges.endIndex + 1 {
            if graph[node, default:[]].count == 1 {
                leaves.append(node)
            }
        }
        while remainNodes > 2 {
            layers += 1
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
        if remainNodes == 1 {
            return layers * 2
        } else {
            return layers * 2 + 1
        }
        
    }