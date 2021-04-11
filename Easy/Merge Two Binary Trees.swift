//Merge Two Binary Trees
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if root1 == nil {return root2}
        if root2 == nil {return root1}
        let node = TreeNode(root1!.val+root2!.val)
        node.left = mergeTrees(root1!.left,root2!.left)
        node.right = mergeTrees(root1!.right,root2!.right)
        return node
    }

    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if t1 == nil {return t2}
        var stack = [(t1,t2)]
        
        while stack.isEmpty == false {
            let (t1, t2) = stack.removeLast()
            if t1 == nil || t2 == nil {continue}
            t1!.val += t2!.val    
            
            if t1!.left == nil {
                t1!.left = t2!.left
            } else {
                stack.append((t1!.left,t2!.left))
            }
            if t1!.right == nil {
                t1!.right = t2!.right
            } else {
                stack.append((t1!.right,t2!.right))
            }
            
        }
        
        return t1
    }