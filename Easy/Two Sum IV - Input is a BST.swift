//Two Sum IV - Input is a BST
//O(n), O(n)
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var set = Set<Int>()
        func dfs(_ node: TreeNode?) -> Bool {
            guard let node = node else {return false}
            if set.contains(k-node.val) {return true}
            set.insert(node.val)
            if dfs(node.left) || dfs(node.right) {
                return true
            } 
            return false
        }
        return dfs(root)
    }

    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var set = Set<Int>()
        func dfs(_ node: TreeNode?) -> Bool {
            guard let node = node else {return false}
            if set.contains(k-node.val) {
                return true
            }
            set.insert(node.val)
            return dfs(node.left) || dfs(node.right)
        }
        return dfs(root)
    }