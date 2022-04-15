//Trim a Binary Search Tree
//O(n), O(h)
    func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
        guard let node = root else {return nil}
        node.left = trimBST(node.left, low, high)
        node.right = trimBST(node.right, low, high)
        if node.val < low {
            return node.right
        } else if node.val > high {
            return node.left
        }
        return node
    }