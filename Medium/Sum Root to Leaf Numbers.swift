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

//O(n), O(h)
    func sumNumbers(_ root: TreeNode?) -> Int {
        var res = 0
        func dfs(_ curr: Int, _ node: TreeNode?) {
            guard let node = node else {return }
            var curr = curr
            curr *= 10
            curr += node.val
            if node.left == nil && node.right == nil {
                res += curr
            }
            dfs(curr, node.left)
            dfs(curr, node.right)
        }
        dfs(0, root)
        return res
    }