//Diameter of Binary Tree
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var res = 0
        
        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else {return 0}
            let left = dfs(node.left)
            let right = dfs(node.right)
            res = max(res, left + right)
            return max(left,right) + 1
        }
        
        dfs(root)
        
        return res
    }