//Maximum Average Subtree
//O(n) O(h)
    func maximumAverageSubtree(_ root: TreeNode?) -> Double {
        var res: Double = 0
        func dfs(_ node: TreeNode?) -> (sum: Int, count: Int) {
            guard let node = node else {return (0,0)}
            let (leftNum, leftCount) = dfs(node.left)
            let (rightNum, rightCount) = dfs(node.right)
            let currTotalNum = leftNum + rightNum + node.val
            let currTotalCount = leftCount + rightCount + 1
            res = max(res, Double(currTotalNum) / Double(currTotalCount))
            return (currTotalNum, currTotalCount)
        }
        dfs(root)
        return res
    }