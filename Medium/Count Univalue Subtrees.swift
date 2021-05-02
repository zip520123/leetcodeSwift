//Count Univalue Subtrees
//O(n) O(h)
    func countUnivalSubtrees(_ root: TreeNode?) -> Int {
        var res = 0
        func dfs(_ node: TreeNode?) -> Bool {
            guard let node = node else {return true}
            if node.left == nil && node.right == nil {
                res += 1
                return true
            }
            var isUni = true
            if let left = node.left {
                isUni = dfs(left) && isUni && left.val == node.val
            }
            if let right = node.right {
                isUni = dfs(right) && isUni && right.val == node.val
            }
            if isUni == false { return false }
            res += 1
            return true
        }
        dfs(root)
        return res
    }
//O(n) O(h)
    func countUnivalSubtrees(_ root: TreeNode?) -> Int {
        var res = 0
        func dfs(_ node: TreeNode?) -> Bool {
            guard let node = node else {return true}
            let left = dfs(node.left)
            let right = dfs(node.right)
            if left && right {
                if node.left != nil && node.left!.val != node.val {
                    return false
                }
                if node.right != nil && node.right!.val != node.val {
                    return false
                }
                res += 1
                return true
            } 
            return false
        }
        dfs(root)
        return res
    }

    func countUnivalSubtrees(_ root: TreeNode?) -> Int {
        var res = 0
        func dfs(_ node:TreeNode?) -> Bool {
            guard let node = node else {return true}
            if node.left == nil && node.right == nil {
                res += 1
                return true
            }
            let left = dfs(node.left)
            let right = dfs(node.right)
            var isUni = left && right
            if node.left != nil && node.left!.val != node.val {
                isUni = false
            }
            if node.right != nil && node.right!.val != node.val {
                isUni = false
            }
            if isUni {
                res += 1    
            }

            return isUni
        }
        dfs(root)
        return res
    }