// Count Nodes Equal to Average of Subtree
// O(n), O(n)
    func averageOfSubtree(_ root: TreeNode?) -> Int {

        func dfs(_ root: TreeNode?) -> (subNodeCount: Int, sum: Int, resCount: Int) {
            guard let node = root else {return (0, 0, 0)}
            let left = dfs(node.left)
            let right = dfs(node.right)
            let currCount = left.subNodeCount + right.subNodeCount + 1
            let currSum = left.sum + node.val + right.sum
            var currResCount = left.resCount + right.resCount 
            if currSum / currCount == node.val {
                currResCount += 1
            }
            return (currCount, currSum, currResCount)
        }
        
        return dfs(root).resCount
    }