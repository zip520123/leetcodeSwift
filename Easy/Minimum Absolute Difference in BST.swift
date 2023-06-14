//Minimum Absolute Difference in BST
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var res = Int.max
        var prev: Int?
        func dfs(_ node:TreeNode?) {
            guard let node = node else {return}
            dfs(node.left)
            if prev != nil {
                res = min(res, abs(prev! - node.val))
            } 
            prev = node.val
            dfs(node.right)
        }
        dfs(root)
        return res
    }

//O(n),O(n)
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var node = root
        var stack = [TreeNode]()
        var prev: TreeNode?
        var res = Int.max
        while node != nil || !stack.isEmpty {

            while node != nil {
                stack.append(node!)
                node = node!.left
            }
            node = stack.removeLast()
            if let prev = prev {
                res = min(res, abs(prev.val-node!.val))
            }
            prev = node
            node = node!.right
        }
        return res
    }