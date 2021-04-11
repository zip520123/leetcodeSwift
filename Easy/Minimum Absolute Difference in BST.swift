//Minimum Absolute Difference in BST
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var res = Int.max
        var prev: Int?
        func dfs(_ node:TreeNode?) {
            guard let node = node else {return}
            dfs(node.left)
            if prev != nil {
                res = min(res, abs(prev! - node.val))
            } 
            prev = node.val
            dfs(node.right)
        }
        dfs(root)
        return res
    }