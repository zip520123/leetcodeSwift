//Path Sum
//O(n) O(h)
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        
        func dfs(_ node: TreeNode?, _ curr: Int) -> Bool {
            guard let node = node else {return false}
            if node.left == nil && node.right == nil {
                if curr + node.val == targetSum {
                    return true
                } else {
                    return false
                }
            }
            var res = false
            res = res || dfs(node.left, curr + node.val)
            res = res || dfs(node.right, curr + node.val)
            return res
        }
        return dfs(root,0)
    }
    
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let node = root else {return false}
        if node.left == nil && node.right == nil {
            return node.val == targetSum
        }
        return hasPathSum(node.left, targetSum - node.val) || hasPathSum(node.right, targetSum - node.val)
    }