//Binary Tree Paths
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let node = root else {return []}
        let left = binaryTreePaths(node.left)
        let right = binaryTreePaths(node.right)
        if left.isEmpty && right.isEmpty {return ["\(node.val)"]}
        return (left + right).map { "\(node.val)->\($0)" }
    }