/*Binary Tree Maximum Path Sum*/
func maxPathSum(_ root: TreeNode?) -> Int {
    var res = -Int.max
    func dfs(_ curr: TreeNode?) -> Int {
        if curr == nil {return 0}
        let leftValue = max(dfs(curr!.left),0)
        let rightValue = max(dfs(curr!.right),0)
        res = max(leftValue + rightValue + curr!.val, res)
        return max(leftValue, rightValue) + curr!.val
    }
    dfs(root)
    return res
}