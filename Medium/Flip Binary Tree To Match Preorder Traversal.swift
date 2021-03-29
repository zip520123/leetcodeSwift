/*Flip Binary Tree To Match Preorder Traversal*/
    func flipMatchVoyage(_ root: TreeNode?, _ voyage: [Int]) -> [Int] {
        var i = 0, res = [Int](), v = voyage
        func dfs(_ node: TreeNode?) -> Bool {
            guard let node = node else {return true}
            if node.val != v[i] {return false}
            i+=1
            if node.left != nil && node.left!.val != v[i] {
                res.append(node.val)
                return dfs(node.right) && dfs(node.left)
            } else {
                return dfs(node.left) && dfs(node.right)
            }
        }
        return dfs(root) ? res : [-1]
    }