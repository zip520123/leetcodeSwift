//Construct Binary Search Tree from Preorder Traversal
//O(n), O(n)
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        var i = 0
        func dfs(_ minN: Int, _ maxN: Int) -> TreeNode? {
            guard i<preorder.endIndex else {return nil}
            let n = preorder[i]
            if n > minN && n < maxN {
                let node = TreeNode(n)
                i += 1
                node.left = dfs(minN, n)
                node.right = dfs(n, maxN)
                return node
            } else {
                return nil
            }
        }
        
        return dfs(-Int.max, Int.max)
    }