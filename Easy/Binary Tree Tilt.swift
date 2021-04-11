//Binary Tree Tilt
    func findTilt(_ root: TreeNode?) -> Int {
        var res = 0
        
        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else {return 0}
            let left = dfs(node.left)
            let right = dfs(node.right)
            res += abs(left - right)
            return node.val + left + right
        }
        
        dfs(root)
        return res
    }