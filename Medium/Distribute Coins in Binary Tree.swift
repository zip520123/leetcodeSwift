// Distribute Coins in Binary Tree
// O(n), O(n)
func distributeCoins(_ root: TreeNode?) -> Int {
    var res = 0
    func dfs(_ node: TreeNode?) -> Int {
        if node == nil { return 0}
        let left = dfs(node!.left)
        let right = dfs(node!.right)
        res += abs(left) + abs(right)
        return node!.val - 1 + left + right
    }
    dfs(root)
    return res
}