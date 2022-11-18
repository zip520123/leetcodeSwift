//Average of Levels in Binary Tree
//O(n), O(1)
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let node = root else {return []}
        var queue = [node], res = [Double]()
        while !queue.isEmpty {
            let temp = queue
            queue.removeAll()
            var value = 0
            for curr in temp {
                value += curr.val
                if let left = curr.left {queue.append(left)}
                if let right = curr.right {queue.append(right)}
            }
            res.append(Double(value)/Double(temp.count))
        }
        return res
    }