/*Lowest Common Ancestor of a Binary Search Tree*/
//time O(n) space O(n)
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root else {return nil}
    if root.val == q!.val || root.val == p!.val {return root}
    let left = lowestCommonAncestor(root.left,p,q)
    let right = lowestCommonAncestor(root.right,p,q)
    if left != nil && right != nil {return root}
    if left == nil && right == nil {return nil}
    if left != nil {
        return left
    }
    return right
    
}

//time O(n) space O(1)
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    let pVal = p!.val
    let qVal = q!.val
    var curr = root
    
    while let node = curr {
        if pVal > node.val && qVal > node.val {
            curr = node.right
        } else if pVal < node.val && qVal < node.val {
            curr = node.left
        } else {
            return node
        }
    }
    return nil
}