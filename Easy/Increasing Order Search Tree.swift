//Increasing Order Search Tree
//O(n), O(n)
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        if root == nil {return nil}
        var curr = root
        var stack = [TreeNode]()
        var arr = [TreeNode]()
        while curr != nil || !stack.isEmpty {
            while curr != nil {
                stack.append(curr!)
                curr = curr!.left
            }
            curr = stack.removeLast()
            arr.append(curr!)
            curr = curr!.right
        }

        for i in 0..<arr.endIndex-1 {
            arr[i].left = nil
            arr[i].right = arr[i+1]
        }
        arr[arr.endIndex-1].left = nil
        return arr[0]
    }
    
//O(n), O(h)
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        var res = TreeNode()
        var curr = res
        func dfs(_ node: TreeNode?) {
            guard let node = node else { return }    
            dfs(node.left)
            node.left = nil
            curr.right = node
            curr = curr.right!
            dfs(node.right)
        }
        dfs(root)
        return res.right
    }