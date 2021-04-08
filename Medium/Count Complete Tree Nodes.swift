//Count Complete Tree Nodes
//O(n) O(h)
func countNodes(_ root: TreeNode?) -> Int {
    var res = 0
    func dfs(_ node: TreeNode?) {
        guard let node = node else {return}
        res += 1
        dfs(node.left)
        dfs(node.right)
    }
    dfs(root)
    return res
}

//O(log n * log n) O(h)
func countNodes(_ root: TreeNode?) -> Int {
    guard let node = root else {return 0}
    var leftLevel = 0
    var curr = node.left
    while curr != nil {
        leftLevel += 1
        curr = curr!.left
    }
    var rightLevel = 0
    curr = node.right
    while curr != nil {
        rightLevel += 1
        curr = curr!.right
    }
    if leftLevel == rightLevel {
        return 2<<leftLevel - 1
    } else {
        
        return 1 + countNodes(node.left) + countNodes(node.right)
    }
    
}