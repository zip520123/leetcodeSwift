//Delete Nodes And Return Forest
    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        guard let root = root else {return []}
        var set = Set(to_delete)
        var res = [TreeNode?]()
        if !set.contains(root.val) {
            res.append(root)
        }
        
        func dfs(_ node: TreeNode?) -> TreeNode? {
            guard let node = node else {return nil}
            node.left = dfs(node.left)
            node.right = dfs(node.right)
            if set.contains(node.val) {
                if node.left != nil {res.append(node.left)}
                if node.right != nil {res.append(node.right)}
                return nil
            }
            return node
        }
        dfs(root)
        return res
    }