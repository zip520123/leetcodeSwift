//Equal Tree Partition
//O(n) O(h)
/*
Find a subtree is the sum of entire tree.
RemoveLast one prevented [0,1,-1] 
*/
    func checkEqualTree(_ root: TreeNode?) -> Bool {
        var stack = [Int]()
        func sum(_ node: TreeNode?) -> Int {
            if node == nil {return 0}
            stack.append(sum(node!.left) + sum(node!.right) + node!.val)
            return stack.last!
        }
        let total = sum(root)
        stack.removeLast()
        if total % 2 == 0 {
            for n in stack {
                if n == total / 2 {
                    return true
                }
            }
        }
        return false
    }