//Count Good Nodes in Binary Tree
//O(n), O(h)
    func goodNodes(_ root: TreeNode?) -> Int {
        var res = 0
        func dfs(_ curr: Int, _ node: TreeNode?) {
            guard let node = node else {return}
            if node.val >= curr {res += 1}
            dfs(max(curr,node.val), node.left)
            dfs(max(curr,node.val), node.right)
        }
        dfs(Int.min, root)
        return res
    }