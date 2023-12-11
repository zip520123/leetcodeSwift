/*Binary Tree Inorder Traversal
*/

//Recursive time O(n) space O(n)

    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        func dfs(_ node: TreeNode?) {
            if (node == nil) {
                return
            }
            dfs(node!.left)
            result.append(node!.val)
            dfs(node!.right)
        }
        dfs(root)
        return result
    }

    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let node = root else {return []}
        var res = [Int]()
        res += inorderTraversal(node.left)
        res.append(node.val)
        res += inorderTraversal(node.right)
        return res
    }

    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {return []}
        return  inorderTraversal(root!.left) + [root!.val] + inorderTraversal(root!.right)
    }
//Iterative O(n), O(h)

    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        var stack = [TreeNode]()
        var curr = root
        while !stack.isEmpty || curr != nil {
            while curr != nil {
                stack.append(curr!)
                curr = curr!.left
            }
            curr = stack.removeLast()
            res.append(curr!.val)
            curr = curr!.right
        }
        return res
    }
