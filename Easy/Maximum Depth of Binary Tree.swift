/*Maximum Depth of Binary Tree*/
func maxDepth(_ root: TreeNode?) -> Int {
    var res = 0
    func dfs(_ curr: TreeNode?, _ height: Int) {
        if let node = curr {
            if height + 1 > res {
                res = height + 1
            }
            dfs(node.left, height + 1)
            dfs(node.right, height + 1)
        } else {
            return 
        }
    }
    dfs(root, 0)
    return res
}