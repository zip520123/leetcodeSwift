/*Binary Tree Preorder Traversal*/
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        func dfs(_ node: TreeNode?) {
            guard let node = node else {return}
            res.append(node.val)
            dfs(node.left)
            dfs(node.right)
        }
        dfs(root)
        
        return res
    }

    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {return []}
        var stack = [root!]
        var res = [Int]()
        while !stack.isEmpty {
            let node = stack.removeLast()
            res.insert(node.val,at:0)
            if node.left != nil {stack.append(node.left!)}
            if node.right != nil {stack.append(node.right!)}
        }
        
        return res
    }

    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let node = root else {return []}
        var res = [Int]()
        var stack = [node]
        
        while stack.isEmpty == false {
            let node = stack.removeLast()
            res.append(node.val)
            if let right = node.right{stack.append(right)}
            if let left = node.left {stack.append(left)}
            
        }
        
        return res
    }