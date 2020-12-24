/*Same Tree*/
//time O(n) space O(log(N)) in the best case of completely balanced tree O(n) in the worst case of completely unbalanced tree, to keep a recursion stack.

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q != nil || p != nil && q == nil {return false}
    if p == nil && q == nil {return true}
    
    let res = isSameTree(p!.left, q!.left) && isSameTree(p!.right,q!.right)
    return res && p!.val == q!.val
}

//time O(n) space O(n)
func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    
    if p == nil && q != nil || p != nil && q == nil {return false}
    if p == nil && q == nil {return true}
    
    var leftStack = [TreeNode?]()
    var rightStack = [TreeNode?]()
    leftStack.append(p)
    rightStack.append(q)
    
    while(leftStack.isEmpty == false || rightStack.isEmpty == false) {
        let oleft = leftStack.removeFirst()
        let oright = rightStack.removeFirst()
        
        if oleft == nil && oright != nil || oleft != nil && oright == nil {return false}
        guard let left = oleft, let right = oright else { continue }
        if left.val != right.val {
            return false
        }    
        leftStack.append(left.left)
        rightStack.append(right.left)
        leftStack.append(left.right)
        rightStack.append(right.right)
    
    }
    return true
}