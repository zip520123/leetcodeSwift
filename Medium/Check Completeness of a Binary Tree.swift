//Check Completeness of a Binary Tree
//O(n), O(h)
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        guard let node = root else {return true}
        var queue = [root]
        while !queue.isEmpty && queue.first! != nil {
            let node = queue.removeFirst()
            queue.append(node!.left)
            queue.append(node!.right)
        }
        while !queue.isEmpty && queue.first! == nil {
            queue.removeFirst()
        }
        return queue.isEmpty
    }