//Find Duplicate Subtrees
//O(h), O(n)
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        var dict = [String: Int](), res = [TreeNode?]()
        func dfs(_ node: TreeNode?) -> String {
            guard let node = node else {return ""}
            let left = dfs(node.left)
            let right = dfs(node.right)
            let currStr = String(node.val) + "$" + left + "$" + right
            if dict[currStr, default: 0] == 1 {
                res.append(node)
            }
            dict[currStr, default:0] += 1
            return currStr
        }
        dfs(root)
        return res
    }