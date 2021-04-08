//Longest ZigZag Path in a Binary Tree
//O(n^2) O(h)
    func longestZigZag(_ root: TreeNode?) -> Int {
        guard let node = root else {return 0}
        var res = max(maxZigZag(node,true), maxZigZag(node,false))
        let left = longestZigZag(node.left)
        let right = longestZigZag(node.right)
        res = max(res,left)
        res = max(res,right)
        return res
    }
    func maxZigZag(_ node: TreeNode?, _ directionLeft: Bool) -> Int {
        if node == nil {return -1}
        if directionLeft {
            return maxZigZag(node!.left, false) + 1
        } else {
            return maxZigZag(node!.right, true) + 1
        }
    }
//O(n) O(h)
class Solution {
    func longestZigZag(_ root: TreeNode?) -> Int {
        var max = 0
        func dfs(_ node: TreeNode?, _ depth: Int,_ direction: Bool) { //direction: true is right, false is left
            guard let node = node else {return}
            max = Swift.max(max, depth)
            
            dfs(node.left, direction ? 0: depth+1, !direction)//if previous direction was right, and now going left, we add 1 to depth, else starting again as 0
            dfs(node.right, direction ? depth+1: 0, !direction)
        }
        dfs(root,0,true) //try both directions, and choose the better one
        dfs(root,0,false)
        return max
    }
}

// Recursive return [left, right, result], where:
// left is the maximum length in direction of root.left
// right is the maximum length in direction of root.right
// result is the maximum length in the whole sub tree.
    public int longestZigZag(TreeNode root) {
        return dfs(root)[2];
    }

    private int[] dfs(TreeNode root) {
        if (root == null) return new int[]{-1, -1, -1};
        int[] left = dfs(root.left), right = dfs(root.right);
        int res = Math.max(Math.max(left[1], right[0]) + 1, Math.max(left[2], right[2]));
        return new int[]{left[1] + 1, right[0] + 1, res};
    }
