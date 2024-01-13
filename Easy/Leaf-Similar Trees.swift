//Leaf-Similar Trees
//O(n), O(h)
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {

        func dfs(_ node: TreeNode?) -> [Int] {
            guard let node = node else {return []}
            if node.left == nil && node.right == nil {
                return [node.val]
            }
            let left = dfs(node.left)
            let right = dfs(node.right)
            return left + right
        }

        return dfs(root1) == dfs(root2)
    }

// O(n), O(w)
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        func dfs(_ node: TreeNode?) -> [Int] {
            guard let node else {return []}
            var stack = [TreeNode]()
            var res = [Int]()
            var curr: TreeNode? = node
            while !stack.isEmpty || curr != nil {
                while curr != nil {
                    stack.append(curr!)
                    curr = curr!.left
                }
                curr = stack.removeLast()
                if curr!.left == nil && curr!.right == nil {
                    res.append(curr!.val)
                }
                
                curr = curr!.right
            }
            return res
        }
        return dfs(root1) == dfs(root2)
    }