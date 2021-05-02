//Find Leaves of Binary Tree
//O(n) O(n)
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        var dict = [Int:[Int]]()
        
        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else {return -1}
            let left = dfs(node.left)
            let right = dfs(node.right)
            let curr = max(left, right) + 1
            dict[curr,default:[]].append(node.val)
            return curr
        }
        dfs(root)
        
        return dict.sorted { $0.key < $1.key }.map { $0.value }
    }