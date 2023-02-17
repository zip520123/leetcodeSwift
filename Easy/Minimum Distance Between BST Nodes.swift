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

//O(n), O(n)
    func minDiffInBST(_ root: TreeNode?) -> Int {
        var prev: TreeNode?
        var res = Int.max
        func dfs(_ node: TreeNode?) {
            guard let node = node else {return}
            dfs(node.left)
            if let prevNode = prev {
                res = min(res, abs(node.val - prevNode.val))
            }
            prev = node
            dfs(node.right)
        }
        dfs(root)
        return res
    }