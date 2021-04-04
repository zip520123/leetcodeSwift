//Binary Tree Level Order Traversal II
//O(n) O(n)
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let node = root else {return []}
        var queue = [node]
        var res = [[Int]]()
        while !queue.isEmpty {
            let temp = queue
            queue.removeAll()
            var curr = [Int]()
            for node in temp {
                curr.append(node.val)
                if let left = node.left {queue.append(left)}
                if let right = node.right {queue.append(right)}
            }
            res.insert(curr, at:0)
        }
        return res
    }