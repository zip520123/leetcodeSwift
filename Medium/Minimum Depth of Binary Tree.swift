//Minimum Depth of Binary Tree
//O(n) O(h)
    func minDepth(_ root: TreeNode?) -> Int {
        guard let node = root else {return 0}
        if node.left == nil || node.right == nil {
            return max(minDepth(node.left), minDepth(node.right)) + 1
        }
        return min(minDepth(node.left), minDepth(node.right)) + 1
    }


    //bfs O(n) O(w)
    func minDepth(_ root: TreeNode?) -> Int {
        guard let node = root else {return 0}
        var level = 0
        var queue = [node]
        while !queue.isEmpty {
            let temp = queue
            queue.removeAll()
            level += 1
            for node in temp {
                if node.left == nil && node.right == nil {
                    return level
                }
                if node.left != nil {queue.append(node.left!)}
                if node.right != nil {queue.append(node.right!)}
            }
        }
        return 0
    }