/*Validate Binary Search Tree*/
//time O(n) space O(n)
func isValidBST(_ root: TreeNode?) -> Bool {
    func dfs(_ node: TreeNode?, _ low: Int, _ high: Int) -> Bool {
        guard let node = node else {return true}
        if node.val <= low || node.val >= high {return false}
        return dfs(node.left, low, node.val) && dfs(node.right, node.val, high)
        
    }
    return dfs(root, -Int.max, Int.max )
}
//time O(n) space O(n) 
func isValidBST(_ root: TreeNode?) -> Bool {
    guard let node = root else {return true}
    var nodeStack = [node]
    var lowStack = [-Int.max]
    var highStack = [Int.max]
    
    while !nodeStack.isEmpty {
        let node = nodeStack.removeFirst()
        let low = lowStack.removeFirst()
        let high = highStack.removeFirst()
        
        if node.val <= low || node.val >= high {
            return false
        }
        if let left = node.left {
            nodeStack.append(left)
            lowStack.append(low)
            highStack.append(node.val)
        }
        if let right = node.right {
            nodeStack.append(right)
            lowStack.append(node.val)
            highStack.append(high)
        }
    }
    return true
}