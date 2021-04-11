//Find Bottom Left Tree Value
//O(n) O(h)
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        var maxLevel = -1, res = 0
        
        func dfs(_ node: TreeNode?, _ level: Int) {
            guard let node = node else {return}
            dfs(node.left, level+1)
            if level > maxLevel {
                maxLevel = level
                res = node.val
            }
            dfs(node.right, level+1)
        }
        dfs(root, 0)
        return res
    }
//O(n) O(w)
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        guard let node = root else {return 0}
        var res = 0
        var queue = [node]
        while !queue.isEmpty {
            let temp = queue
            queue.removeAll()
            res = temp.first!.val
            for node in temp {
                if node.left != nil {queue.append(node.left!)}
                if node.right != nil {queue.append(node.right!)}
            }
        }
        
        return res
    }