//Balance a Binary Search Tree
//O(n), O(n)
class Solution {
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        var arr = [Int]()
        
        func dfs(_ node: TreeNode?) {
            guard let node = node else {return}
            dfs(node.left)
            arr.append(node.val)
            dfs(node.right)
        }
        dfs(root)
        
        func createBST(_ l: Int, _ r: Int) -> TreeNode? {
            if l > r {return nil}
            if l == r {return TreeNode(arr[l])}
            let mid = (l+r)>>1
            let node = TreeNode(arr[mid])
            node.left = createBST(l,mid-1)
            node.right = createBST(mid+1,r)
            return node
        }
        return createBST(0, arr.endIndex-1)
    }
}