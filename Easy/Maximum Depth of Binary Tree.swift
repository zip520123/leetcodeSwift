/*Maximum Depth of Binary Tree*/
func maxDepth(_ root: TreeNode?) -> Int {
    var res = 0
    func dfs(_ curr: TreeNode?, _ height: Int) {
        if let node = curr {
            if height + 1 > res {
                res = height + 1
            }
            dfs(node.left, height + 1)
            dfs(node.right, height + 1)
        } else {
            return 
        }
    }
    dfs(root, 0)
    return res
}

func maxDepth(_ root: TreeNode?) -> Int {
    
    func dfs(_ node: TreeNode?, _ curr: Int) -> Int {
        if node == nil {return curr}
        let res = max(dfs(node!.left, curr+1),dfs(node!.right, curr+1))
        return res
    }
    
    return dfs(root, 0)
}

func maxDepth(_ root: TreeNode?) -> Int {
    guard let node = root else {return 0}
    let left = maxDepth(node.left), right = maxDepth(node.right)
    return max(left, right) + 1
}