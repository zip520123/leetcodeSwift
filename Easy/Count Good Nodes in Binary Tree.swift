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

//O(n), O(h)
    func goodNodes(_ root: TreeNode?) -> Int {
        
        func dfs(_ curr: Int, _ node: TreeNode?) -> Int {
            guard let node = node else {return 0}
            var res = 0
            if node.val >= curr {res += 1}
            res += dfs(max(curr, node.val), node.left)
            res += dfs(max(curr, node.val), node.right)
            return res
        } 
        
        return dfs(Int.min, root)
    }