/*Binary Tree Inorder Traversal

Given the root of a binary tree, return the inorder traversal of its nodes' values.

 

Example 1:


Input: root = [1,null,2,3]
Output: [1,3,2]
Example 2:

Input: root = []
Output: []
Example 3:

Input: root = [1]
Output: [1]
Example 4:


Input: root = [1,2]
Output: [2,1]
Example 5:


Input: root = [1,null,2]
Output: [1,2]
*/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
//Recursive time O(n) space O(n)
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        func dfs(_ node: TreeNode?) {
            if (node == nil) {
                return
            }
            dfs(node!.left)
            result.append(node!.val)
            dfs(node!.right)
        }
        dfs(root)
        return result
    }
}
//Iterative 
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        var arr = [TreeNode]()
        var curr = root
        
        while(arr.count > 0 || curr != nil) {
            while(curr != nil) {
                arr.append(curr!)
                curr = curr!.left
            }
            curr = arr.removeLast()
            res.append(curr!.val)
            curr = curr!.right
        }
        
        return res    
    }
}