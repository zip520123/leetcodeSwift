/*Binary Tree Maximum Path Sum*/
func maxPathSum(_ root: TreeNode?) -> Int {
    var res = -Int.max
    func dfs(_ curr: TreeNode?) -> Int{
        guard let curr = curr else {return 0}
        let left = max(dfs(curr.left), 0)
        let right = max(dfs(curr.right), 0)
        res = max(left+right+curr.val, res)
        return max(left, right) + curr.val
    }
    dfs(root)
    return res
}

//O(n), O(h)
    func maxPathSum(_ root: TreeNode?) -> Int {
        var res = Int.min
        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else {return 0}
            let left = dfs(node.left)
            let right = dfs(node.right)
            res = max(res, node.val + left + right, node.val, node.val+left, node.val+right)
            return max(node.val, node.val+left, node.val+right)
        }    
        dfs(root)
        return res
    }