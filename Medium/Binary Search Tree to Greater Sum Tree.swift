//Binary Search Tree to Greater Sum Tree
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        var sum = 0
        func dfs(_ node: TreeNode?) {
            guard let node = node else {return}
            dfs(node.right)
            sum += node.val
            node.val = sum
            dfs(node.left)
        }
        dfs(root)
        return root
    }

    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        guard let node = root else {return nil}
        var sum = 0
        var stack = [TreeNode]()
        var curr = root
        while stack.isEmpty == false || curr != nil {
            while curr != nil {
                stack.append(curr!)
                curr = curr!.right
            }
            curr = stack.removeLast()
            sum += curr!.val
            curr!.val = sum
            curr = curr!.left
        }
        return root
    }