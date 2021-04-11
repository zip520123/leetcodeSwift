//Find Largest Value in Each Tree Row
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let node = root else {return []}
        var res = [Int]()
        
        var queue = [node]
        
        while queue.isEmpty == false {
            let temp = queue
            queue.removeAll()
            var localMax = -Int.max
            for curr in temp {
                localMax = max(localMax,curr.val)
                if curr.left != nil {queue.append(curr.left!)}
                if curr.right != nil {queue.append(curr.right!)}
            }
            res.append(localMax)
        }
        
        return res
    }