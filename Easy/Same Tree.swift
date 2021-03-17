/*Same Tree*/
//time O(n) space O(log(N)) in the best case of completely balanced tree O(n) in the worst case of completely unbalanced tree, to keep a recursion stack.

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil {return true}
    if p == nil || q == nil {return false}
    if p!.val != q!.val {return false}
    return isSameTree(p!.left,q!.left) && isSameTree(p!.right,q!.right)
}

//time O(n) space O(n)
func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    var stack1 = [p]
    var stack2 = [q]
    
    while !stack1.isEmpty {
        let left = stack1.removeFirst()
        let right = stack2.removeFirst()
        if left == nil && right == nil {continue}
        if left == nil || right == nil {return false}
        guard let leftNode = left, let rightNode = right else {return false}
        if leftNode.val != rightNode.val {return false}
        stack1.append(leftNode.left)
        stack2.append(rightNode.left)
        stack1.append(leftNode.right)
        stack2.append(rightNode.right)
        
    }
    return true
}