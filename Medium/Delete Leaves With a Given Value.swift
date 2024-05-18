// Delete Leaves With a Given Value
// O(n), O(n)
func removeLeafNodes(_ root: TreeNode?, _ target: Int) -> TreeNode? {
    if root == nil { return nil }
    root!.left = removeLeafNodes(root!.left, target)
    root!.right = removeLeafNodes(root!.right, target)
    if root!.left == nil, root!.right == nil, root!.val == target { return nil }
    return root
}