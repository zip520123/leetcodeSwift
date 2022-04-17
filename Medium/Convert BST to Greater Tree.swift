//Convert BST to Greater Tree
//O(n), O(h)
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        var curr = 0
        func dfs(_ node: TreeNode?) {
            guard let node = node else {return}
            dfs(node.right)
            node.val += curr
            curr = node.val
            dfs(node.left)
        }
        dfs(root)
        return root
    }

    func convertBST(_ root: TreeNode?) -> TreeNode? {
        var node = root
        var queue = [TreeNode]()
        var curr = 0
        while node != nil || !queue.isEmpty { 
            while node != nil {
                queue.append(node!)
                node = node!.right
            }
            node = queue.removeLast()
            node!.val += curr
            curr = node!.val
            node = node!.left
        }
        return root
    }