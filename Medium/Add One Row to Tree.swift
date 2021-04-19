//Add One Row to Tree
//O(n) O(h)
    func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
        if depth == 1 {
            let node = TreeNode(val)
            node.left = root
            return node
        } 
        
        func dfs(_ node: TreeNode?, _ level: Int) -> TreeNode? {
            guard let node = node else {return nil}
            if level == depth - 1 {
                let newLeft = TreeNode(val)
                newLeft.left = node.left
                node.left = newLeft
                let newRight = TreeNode(val)
                newRight.right = node.right
                node.right = newRight
                return node
            } else {
                node.left = dfs(node.left, level+1)
                node.right = dfs(node.right, level+1)
                return node
            }
        }
        dfs(root, 1)
        return root
    }