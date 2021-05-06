//Diameter of N-Ary Tree
//O(n) O(n) BFS create graph find farthest node, bfs search from farthest 
    func diameter(_ root: Node?) -> Int {
        guard let root = root else {return 0}
        var graph = [Node: [Node]]()
        var queue:[(Node, Node)] = []
        for child in root.children {
            queue.append((root, child))
        }
        if root.children.endIndex == 0 {return 0}
        var preQueue:[(Node, Node)] = []
        while queue.isEmpty == false {
            preQueue = queue
            queue.removeAll()
            for (currRoot, node) in preQueue {
                graph[node, default:[]].append(currRoot) 
                graph[currRoot, default:[]].append(node) 
                for child in node.children {
                    queue.append((node, child))
                }
            }
        }
        
        var level = 0
        queue = [preQueue[0]]
        
        var seen = Set<Node>()
        while queue.isEmpty == false {
            preQueue = queue
            queue.removeAll()
            level += 1
            for (_, node) in preQueue {
                seen.insert(node)
                for neighber in graph[node, default:[]] {
                    if seen.contains(neighber) == false {
                        queue.append((node, neighber))
                    }
                }
            }
        }      
        
        return level - 1
    }