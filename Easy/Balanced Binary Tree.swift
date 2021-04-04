/*Balanced Binary Tree*/
//O(n^2) O(tree height)
class Solution {
    func depth(_ node: TreeNode?) -> Int {
        if node == nil {return 0}
        return max(depth(node!.left), depth(node!.right)) + 1
    }
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let node = root else {return true}
        return abs(depth(node.left) - depth(node.right)) <= 1 && isBalanced(node.left) && isBalanced(node.right)
    }
}  

//O(n) O(tree height)
class Solution {
    func height(_ root: TreeNode?) -> Int {
        if root == nil {return 0}
        let left = height(root!.left)
        if left == -1 {return -1}
        let right = height(root!.right)
        if right == -1 {return -1}
        if (abs(left - right) > 1) {return -1}
        return max(left,right)+1
    }
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        return height(root) != -1
    }
}

    func isBalanced(_ root: TreeNode?) -> Bool {
        
        func dfs(_ node: TreeNode?) -> Int {
            guard let node = root else {return 0}
            let left = dfs(node.left)
            if left == -1 {return -1}
            let right = dfs(node.right)
            if right == -1 {return -1}
            if abs(left - right) > 1 {return -1}
            return max(left,right) + 1
        }
        
        return dfs(root) != -1
    }