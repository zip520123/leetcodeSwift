//Sum Root to Leaf Numbers
//O(n) O(h)
    func sumNumbers(_ root: TreeNode?) -> Int {
        var res = 0
        func dfs(_ node: TreeNode?, _ path: String) {
            guard let node = node else {return}
            if node.left == nil && node.right == nil {
                let n = Int(path + "\(node.val)")!
                res += n
                return 
            }
            dfs(node.left, path + "\(node.val)")
            dfs(node.right, path + "\(node.val)")
        }
        dfs(root, "")
        return res
    }