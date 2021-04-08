//Recover Binary Search Tree
//O(n) O(1)
    func recoverTree(_ root: TreeNode?) {
        var startNode : TreeNode?
        var endNode: TreeNode?
        var prevNode: TreeNode?
        func dfs(_ node:TreeNode?) {
            guard let node = node else {return}
            dfs(node.left)
            if let prev = prevNode {
                if prev.val > node.val {
                    if startNode == nil {
                        startNode = prevNode
                    }
                    endNode = node
                }
            }
            prevNode = node
            dfs(node.right)
        }
        dfs(root)
        
        let x = startNode!.val
        startNode!.val = endNode!.val
        endNode!.val = x
        
    }