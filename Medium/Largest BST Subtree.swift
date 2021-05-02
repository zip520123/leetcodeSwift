//Largest BST Subtree
class Solution {
    // return array for each node: 
    //     [0] --> min
    //     [1] --> max
    //     [2] --> largest BST in its subtree(inclusive)
    //if current node value is larger than the max from the left subtree
    //and it is smaller than the minimum from the right subtree
    func largestBSTSubtree(_ root: TreeNode?) -> Int {
        func largestBST(_ node: TreeNode?) -> [Int] {
            guard let node = node else {return [Int.max, Int.min, 0]}
            let left = largestBST(node.left)
            let right = largestBST(node.right)
            if node.val > left[1] && node.val < right[0] {
                return [min(node.val, left[0]), max(node.val, right[1]), left[2] + right[2] + 1]
            }else {
                return [Int.min, Int.max, max(left[2],right[2])]
            }
        }
        let res = largestBST(root)
        return res[2]
    }
}

class Solution {

    struct BST {
        let minVal: Int
        let maxVal: Int
        let count: Int
        init(_ minVal: Int, _ maxVal: Int, _ count: Int) {
            self.minVal = minVal
            self.maxVal = maxVal
            self.count = count
        }
    }
    func largestBSTSubtree(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?) -> BST {
            guard let node = node else {return BST(Int.max,Int.min,0)}
            let left = dfs(node.left)
            let right = dfs(node.right)
            if node.val > left.maxVal && node.val < right.minVal {
                return BST(min(left.minVal, node.val), max(right.maxVal, node.val), left.count + right.count + 1)
            } else {
                return BST(Int.min, Int.max, max(left.count,right.count))
            }
        }
        
        return dfs(root).count
    }
}