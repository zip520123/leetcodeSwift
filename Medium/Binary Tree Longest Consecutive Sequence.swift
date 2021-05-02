//Binary Tree Longest Consecutive Sequence
//O(n) O(h)
    func longestConsecutive(_ root: TreeNode?) -> Int {
        var res = 0
        
        func dfs(_ node: TreeNode?, _ val: Int, _ count: Int) {
            guard let node = node else {return}
            if node.val == val + 1 {
                res = max(res, count+1)
                dfs(node.left,node.val, count+1)
                dfs(node.right,node.val, count+1)
            } else {
                res = max(res,1)
                dfs(node.left,node.val, 1)
                dfs(node.right,node.val, 1)
            }
        }
        dfs(root,-Int.max,0)
        return res
    }
//Botton up
    func longestConsecutive(_ root: TreeNode?) -> Int {
        
        func dfs(_ node: TreeNode?, _ val: Int, _ count: Int) -> Int {
            guard let node = node else {return 0}
            var curr = count
            if val + 1 == node.val {
                curr += 1
            } else {
                curr = 1
            }
            let left = dfs(node.left,node.val,curr)
            let right = dfs(node.right,node.val, curr)
            return max(left,right,curr)
        }
        
        return dfs(root,-Int.max,0)
    }