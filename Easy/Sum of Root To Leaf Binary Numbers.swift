//Sum of Root To Leaf Binary Numbers
//O(n) O(h)
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        var sum = 0
        func dfs(_ node: TreeNode?, _ path: Int) {
            guard let node = node else {return}
            if node.left == nil && node.right == nil {
                sum += path << 1 + node.val
                return 
            }
            dfs(node.left, path << 1 + node.val)
            dfs(node.right, path << 1 + node.val)
        }
        dfs(root,0)
        return sum
    }
    
//O(n), O(h)
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        var res = 0
        
        func dfs(_ path: [Int], _ node: TreeNode?) {
            guard let node = node else {return}
            if node.left == nil && node.right == nil {
                let curr = Int((path + [node.val]).map { String($0) }.joined(), radix: 2) ?? 0
                res += curr
                return
            }
            dfs(path+[node.val], node.left)
            dfs(path+[node.val], node.right)
        }
        dfs([], root)
        return res
    }