//Delete Node in a BST
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let node = root else {return nil}
        if node.val > key {
            node.left = deleteNode(node.left, key)
        } else if node.val < key {
            node.right = deleteNode(node.right, key)    
        } else {
            if node.left == nil {return node.right}
            if node.right == nil {return node.left}
            var right = node.right 
            while right!.left != nil {
                right = right!.left
            }
            right!.left = node.left
            return node.right
        }
        
        return node
    }