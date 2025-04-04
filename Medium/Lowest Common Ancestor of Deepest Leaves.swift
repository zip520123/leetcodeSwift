// Lowest Common Ancestor of Deepest Leaves
// O(n), O(n)
func lcaDeepestLeaves(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    var lowestNodes = Set<Int>()
    var queue = [root]
    while !queue.isEmpty {
        let temp = queue
        queue = []
        for node in temp {
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        if queue.isEmpty {
            for node in temp {
                lowestNodes.insert(node.val)
            }
        }
    }

    func dfs(_ node: TreeNode?) -> TreeNode? {
        guard let node = node else { return nil }
        if lowestNodes.contains(node.val) {
            return node
        }
        let left = dfs(node.left)
        let right = dfs(node.right)
        if left != nil && right != nil {
            return node
        }
        if left == nil && right == nil {
            return nil
        }
        if left != nil {
            return left
        }
        return right
    }
    return dfs(root)
}