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

    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let node = root else {return []}
        var res = [Int]()
        var queue = [node]
        
        while queue.isEmpty == false {
            let node = queue.removeLast()
            res.insert(node.val, at:0)
            if node.left != nil {queue.append(node.left!)}
            if node.right != nil {queue.append(node.right!)}
        }
        
        return res
    }