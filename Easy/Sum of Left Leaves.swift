//Sum of Left Leaves
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        var res = 0
        func dfs(_ node: TreeNode?) {
            guard let node = node else {return}
            dfs(node.left)
            dfs(node.right)
            if let left = node.left {
                if left.left == nil && left.right == nil {
                    res += left.val     
                }
            }
        }
        dfs(root)
        
        return res
    }