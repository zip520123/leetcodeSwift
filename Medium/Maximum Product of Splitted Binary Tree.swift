//Maximum Product of Splitted Binary Tree
//O(n), O(h)
class Solution {
    func maxProduct(_ root: TreeNode?) -> Int {
        var res = 0
        let all = countAll(root)
        let mod = Int(1E9 + 7)
        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else {return 0}
            let left = dfs(node.left), right = dfs(node.right)
            let currmax = max((all-left)*left, (all-right)*right)
            res = max(res, currmax)
            return left + node.val + right
        }
        dfs(root)
        return res % mod
    }
    
    func countAll(_ node: TreeNode?) -> Int {
        guard let node = node else {return 0}
        return countAll(node.left) + node.val + countAll(node.right)
    }
}

//O(n), O(h)
    func maxProduct(_ root: TreeNode?) -> Int {
        var total = 0, res = 0
        
        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else {return 0}

            let left = dfs(node.left)
            let right = dfs(node.right)
            res = max(res, left * (total - left), right * (total - right))
            return left + right + node.val
        }
        total = dfs(root)
        dfs(root)
        return res % Int(1E9+7)
    }