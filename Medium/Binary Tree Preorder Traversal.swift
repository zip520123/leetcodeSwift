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

//O(h), O(n)
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let node = root else {return []}
        return [node.val] + preorderTraversal(node.left) + preorderTraversal(node.right)
    }