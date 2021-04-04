/* Binary Tree Postorder Traversal*/
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        func dfs(_ node: TreeNode?) {
            guard let node = node else {return}
            dfs(node.left)
            dfs(node.right)
            res.append(node.val)
        }
        dfs(root)
        return res
    }

    //root right left and reversed
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        if root == nil {return []}
        var stack = [root!]
        while stack.isEmpty == false {
            var node = stack.removeLast()
            res.append(node.val)
            
            if let left = node.left {stack.append(left)}
            if let right = node.right {stack.append(right)}
            
        }
        return res.reversed()
    }