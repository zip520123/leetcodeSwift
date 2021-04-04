//Verify Preorder Serialization of a Binary Tree
class Solution {
    class TreeNode {
        var left: TreeNode?
        var right: TreeNode?
        var val: Int = 0
    }
    //O(n) O(h)
    func isValidSerialization(_ preorder: String) -> Bool {
        var arr = preorder.split(separator:",")
        var isValid = true
        func dfs() -> TreeNode? {
            if let first = arr.first {
                arr.removeFirst()
                if first == "#" {
                    return nil
                }
                let node = TreeNode()
                node.left = dfs()
                node.right = dfs()
                return node
            } else {
                isValid = false
                return nil
            }
        }
        dfs()
        return arr.endIndex == 0 && isValid
    }
}