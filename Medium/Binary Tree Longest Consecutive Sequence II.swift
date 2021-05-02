//Binary Tree Longest Consecutive Sequence II
//O(n) O(h)
    func longestConsecutive(_ root: TreeNode?) -> Int {
        var res = 0
        func dfs(_ node: TreeNode?) -> [Int] {
            guard let node = node else {return [0,0]}
            var dcr = 1, inc = 1
            let left = dfs(node.left)
            if node.left != nil {
                if node.left!.val - 1 == node.val {
                    dcr = left[0] + 1
                } else if node.left!.val + 1 == node.val {
                    inc = left[1] + 1
                }
            }
            let right = dfs(node.right)
            if node.right != nil {
                if node.right!.val - 1 == node.val {
                    dcr = max(dcr, right[0]+1)
                } else if node.right!.val + 1 == node.val {
                    inc = max(inc, right[1]+1)
                }
                
            }
            res = max(dcr+inc-1,res)
            return [dcr, inc]
        }
        dfs(root)
        return res
    }