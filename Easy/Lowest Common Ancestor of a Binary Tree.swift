//Lowest Common Ancestor of a Binary Tree
//O(n) O(h)
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let node = root else {return nil}
        if node.val == p!.val || node.val == q!.val {return node}
        let left = lowestCommonAncestor(node.left,p,q)
        let right = lowestCommonAncestor(node.right,p,q)
        if left != nil && right != nil {return node}
        if left == nil {return right}
        return left
    }

//O(n), O(h)
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let node = root else {return nil}
        if node === p || node === q {return node}
        let left = lowestCommonAncestor(node.left, p,q)
        let right = lowestCommonAncestor(node.right,p,q)
        if left != nil && right != nil {return node}
        if left != nil {return left}
        if right != nil {return right}
        return nil
    }