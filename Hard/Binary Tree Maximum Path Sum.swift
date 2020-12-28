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