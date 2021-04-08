//Search in a Binary Search Tree
//O(h) O(h)
class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let node = root else {return nil}
        if node.val == val {
            return node
        }else if node.val > val {
            return searchBST(node.left,val)
        } else {
            return searchBST(node.right,val)
        }
    }
}