//Maximum Difference Between Node and Ancestor
//O(n), O(h)
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        var res = 0
        
        func dfs(_ node: TreeNode) -> (maxN: Int, minN: Int) {
            if node.left == nil && node.right == nil {
                return (node.val, node.val)
            }
            if node.left == nil {
                let right = dfs(node.right!)
                res = max(res, abs(node.val-right.maxN), abs(node.val-right.minN))
                return (max(node.val, right.maxN), min(node.val, right.minN))
            }
            if node.right == nil {
                let left = dfs(node.left!)
                res = max(res, abs(node.val-left.maxN), abs(node.val-left.minN))
                return (max(node.val, left.maxN), min(node.val, left.minN))
            }
            let left = dfs(node.left!)
            let right = dfs(node.right!)
            let currMax = max(left.maxN, right.maxN)
            let currMin = min(left.minN, right.minN)
            
            res = max(res, abs(node.val-currMax), abs(node.val-currMin))
            
            return (max(currMax,node.val), min(currMin, node.val))
        }
        dfs(root!)
        return res
    }