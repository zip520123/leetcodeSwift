//Inorder Successor in BST II
//O(n) O(1)
    func inorderSuccessor(_ node: Node?) -> Node? {
        guard let node = node else {return nil}
        if node.right != nil {
            var curr = node.right!
            while curr.left != nil {
                curr = curr.left!
            }
            return curr
        }
        var curr: Node? = node
        while curr!.parent != nil && curr === curr!.parent!.right {
            curr = curr!.parent
        }
        return curr?.parent
    }

    func inorderSuccessor(_ node: Node?) -> Node? {
        guard let node = node else {return nil}
        if node.right != nil {
            var curr = node.right 
            while curr!.left != nil {
                curr = curr!.left
            }
            return curr
        }
        
        var curr: Node? = node
        while curr === curr?.parent?.right {
            curr = curr!.parent
        }
        return curr?.parent
    }