/*N-ary Tree Level Order Traversal*/
    func levelOrder(_ root: Node?) -> [[Int]] {
        guard let node = root else {return []}
        
        var res = [[Int]]()
        
        func dfs(_ node: Node, _ level: Int) {
            if level == res.endIndex {res.append([])}
            res[level].append(node.val)
            for child in node.children {
                dfs(child, level + 1)
            }
        } 
        
        dfs(node,0)
        return res
    }

    func levelOrder(_ root: Node?) -> [[Int]] {
        guard let node = root else {return []}
        var queue = [node]
        var res = [[Int]]()
        while !queue.isEmpty {
            let temp = queue
            queue.removeAll()
            var curr = [Int]()
            for node in temp {
                curr.append(node.val)
                queue += node.children
                
            }
            res.append(curr)
        }
        return res
    }