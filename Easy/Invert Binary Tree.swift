/*Invert Binary Tree*/
//time O(n) space O(1)
func invertTree(_ root: TreeNode?) -> TreeNode? {
    if root == nil {return nil}
    let left = invertTree(root!.left)
    let right = invertTree(root!.right)
    root!.left = right 
    root!.right = left
    return root
}

//time O(n) space O(1)
func invertTree(_ root: TreeNode?) -> TreeNode? {
    if root == nil {return nil}
    var queue = [TreeNode]()
    queue.append(root!)
    while queue.isEmpty == false {
        let node = queue.removeFirst()
        let left = node.left
        let right = node.right
        node.left = right
        node.right = left
        if left != nil {
            queue.append(left!)
        }
        if right != nil {
            queue.append(right!)
        }
    }
    return root
}