//Check If a String Is a Valid Sequence from Root to Leaves Path in a Binary Tree
//O(n), O(h), n = tree.len, h = tree.height
    func isValidSequence(_ root: TreeNode?, _ arr: [Int]) -> Bool {
        func dfs(_ node: TreeNode?, _ index: Int) -> Bool {
            guard let node = node, index < arr.endIndex else {return false}
            if node.val == arr[index] {
                if index == arr.endIndex-1 && node.left == nil && node.right == nil {return true}
                let left = dfs(node.left, index+1)
                let right = dfs(node.right, index+1)
                if left == true {return true}
                if right == true {return true}
                return false
            } else {
                return false
            }
        }
        return dfs(root, 0)
    }