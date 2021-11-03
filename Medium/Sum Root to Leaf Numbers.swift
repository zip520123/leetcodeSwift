//Sum Root to Leaf Numbers
//O(n) O(h)
    func sumNumbers(_ root: TreeNode?) -> Int {
        var res = 0
        
        func dfs(_ node: TreeNode?, _ s: String) {
            guard let node = node else {return}
            let n = s + String(node.val)
            if node.left == nil && node.right == nil {
                res += Int(n)!
            }
            dfs(node.left, n)
            dfs(node.right, n)
            
        }
        dfs(root, "")
        
        return res
    }