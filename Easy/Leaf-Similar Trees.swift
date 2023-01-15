//Leaf-Similar Trees
//O(n), O(h)
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {

        func dfs(_ node: TreeNode?) -> [Int] {
            guard let node = node else {return []}
            if node.left == nil && node.right == nil {
                return [node.val]
            }
            let left = dfs(node.left)
            let right = dfs(node.right)
            return left + right
        }

        return dfs(root1) == dfs(root2)
    }