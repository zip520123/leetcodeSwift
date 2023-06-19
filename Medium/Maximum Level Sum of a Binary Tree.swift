// Maximum Level Sum of a Binary Tree
// O(n), O(n)
    func maxLevelSum(_ root: TreeNode?) -> Int {
        guard let node = root else {return 0}
        var maxlevel = 0
        var maxVal = Int.min
        var queue = [node]
        var currlevel = 0
        while !queue.isEmpty {
            let temp = queue
            queue = []
            var curr = 0
            currlevel += 1
            for node in temp {
                curr += node.val
                node.left.map { queue.append($0) }
                node.right.map { queue.append($0) }
            }
            if curr > maxVal {
                maxlevel = currlevel
                maxVal = curr
            }
        }
        return maxlevel
    }