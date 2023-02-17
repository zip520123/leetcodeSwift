//Minimum Distance Between BST Nodes
//O(n), O(n)
    func minDiffInBST(_ root: TreeNode?) -> Int {
        var arr = [Int]()
        func dfs(_ node: TreeNode?) {
            guard let node = node else {return}
            dfs(node.left)
            arr.append(node.val)
            dfs(node.right)
        }
        dfs(root)
        var res = Int.max
        for i in 0..<arr.endIndex-1 {
            res = min(res, abs(arr[i]-arr[i+1]))
        }
        return res
    }