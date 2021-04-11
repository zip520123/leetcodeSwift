//Deepest Leaves Sum
//O(n) O(h)
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        var res = 0, deepestLevel = -1
        func dfs(_ node: TreeNode?, _ level: Int) {
            guard let node = node else {return}
            if level > deepestLevel {
                res = node.val
                deepestLevel = level
            } else if level == deepestLevel {
                res += node.val
            }
            dfs(node.left, level + 1)
            dfs(node.right, level + 1)
        }
        dfs(root, 0)
        return res
    }
//O(n) O(w)
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        guard let node = root else {return 0}
        var res = 0
        var queue = [node]
        while queue.isEmpty == false {
            let temp = queue
            queue.removeAll()
            var curr = 0
            for node in temp {
                curr += node.val
                if node.left != nil {queue.append(node.left!)}
                if node.right != nil {queue.append(node.right!)}
            }
            res = curr
        }
        return res
    }