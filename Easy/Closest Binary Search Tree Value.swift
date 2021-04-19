//Closest Binary Search Tree Value
//O(n)
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        var diff : Double = Double.infinity
        var res = Int.max
        func dfs(_ node: TreeNode?) {
            guard let node = node else {return}
            if abs(diff) > abs(target - Double(node.val)) {
                diff = target - Double(node.val)
                res = node.val
            }
            dfs(node.left)
            dfs(node.right)
        }
        dfs(root)
        return res
    }