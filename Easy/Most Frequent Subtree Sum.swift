//Most Frequent Subtree Sum
//O(n) O(n)
    func findFrequentTreeSum(_ root: TreeNode?) -> [Int] {
        var dict = [Int:Int]()
        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else {return 0}
            let left = dfs(node.left)
            let right = dfs(node.right)
            let sum = node.val+left+right
            dict[sum, default:0] += 1
            return sum
        }
        dfs(root)
        
        var maxCount = 0
        for (key,value) in dict {
            maxCount = max(maxCount,value)
        }
        var res = [Int]()
        for (key,value) in dict {
            if value == maxCount {
                res += [key]
            }
        }

        return res
    }