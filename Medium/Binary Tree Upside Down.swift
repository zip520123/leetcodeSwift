//Binary Tree Upside Down
    func upsideDownBinaryTree(_ root: TreeNode?) -> TreeNode? {
        guard let node = root, let left = node.left else {return root}
        let newRoot = upsideDownBinaryTree(node.left)
        left.left = node.right
        left.right = node
        node.left = nil
        node.right = nil
        return newRoot
    }

    func upsideDownBinaryTree(_ root: TreeNode?) -> TreeNode? {
        var curr = root
        var prev: TreeNode?
        var temp: TreeNode?
        var next: TreeNode?
        while curr != nil {
            next = curr!.left    
            curr!.left = temp
            temp = curr!.right
            curr!.right = prev
            prev = curr
            curr = next
        }
        return prev
    }