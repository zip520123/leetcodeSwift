//Sum of Root To Leaf Binary Numbers
//O(n) O(h)
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        var sum = 0
        func dfs(_ node: TreeNode?, _ path: Int) {
            guard let node = node else {return}
            if node.left == nil && node.right == nil {
                sum += path << 1 + node.val
                return 
            }
            dfs(node.left, path << 1 + node.val)
            dfs(node.right, path << 1 + node.val)
        }
        dfs(root,0)
        return sum
    }