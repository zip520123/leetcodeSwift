//Binary Tree Zigzag Level Order Traversal
//O(n) O(w) level order
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let node = root else {return []}
        var flip = false
        var res = [[Int]]()
        var queue = [node]
        
        while queue.isEmpty == false {
            let temp = queue
            queue.removeAll()
            var curr = [Int]()
            for node in temp {
                curr.append(node.val)
                if node.left != nil {queue.append(node.left!)}
                if node.right != nil {queue.append(node.right!)}
            }
            if flip {curr.reverse()}
            flip = !flip
            res.append(curr)
        }
        
        return res
    }
//O(n) O(h) dfs
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        
        func dfs(_ level: Int, _ node: TreeNode?) {
            guard let node = node else {return}
            if level == res.endIndex {res.append([])}
            if level % 2 == 1 {
                res[level].insert(node.val,at:0)
            } else {
                res[level].append(node.val)    
            }
            dfs(level+1,node.left)
            dfs(level+1,node.right)
        }
        
        dfs(0,root)
        return res
    }