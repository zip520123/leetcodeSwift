//Binary Tree Pruning
//O(n), O(h)
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        guard let node = root else {return nil}
        let left = pruneTree(node.left), right = pruneTree(node.right)
        let newNode = TreeNode(node.val)
        newNode.left = left
        newNode.right = right
        
        if left == nil && right == nil && node.val == 0 {return nil}
        return newNode
    }