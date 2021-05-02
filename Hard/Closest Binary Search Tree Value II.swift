//Closest Binary Search Tree Value II
//O(n log n) O(n)
    func closestKValues(_ root: TreeNode?, _ target: Double, _ k: Int) -> [Int] {
        var arr = [Int]()
        
        func dfs(_ node: TreeNode?) {
            guard let node = node else {return}
            var l = 0, r = arr.endIndex 
            while l < r {
                let mid = (l+r)>>1
                if abs(Double(arr[mid]) - target) < abs(Double(node.val) - target) {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            arr.insert(node.val, at: l)
            dfs(node.left)
            dfs(node.right)
        }
        
        dfs(root)
        return Array(arr[0..<k])
    }