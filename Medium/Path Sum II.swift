//Path Sum II
//O(n) O(h)
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var res = [[Int]]()
        
        func dfs(_ node: TreeNode?, _ curr: Int, _ list: [Int]) {
            guard let node = node else {return}
            if node.left == nil && node.right == nil {
                let sum = curr + node.val    
                if sum == targetSum {
                    res.append(list + [node.val])
                }
            }
            dfs(node.left, curr+node.val, list + [node.val])
            dfs(node.right, curr+node.val, list + [node.val])
        }
        
        dfs(root,0,[])
        return res
    }