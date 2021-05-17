/*Binary Tree Level Order Traversal*/
//time O(n) space O(n)
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var stack = [TreeNode]()
    var res = [[Int]]()
    if let node = root {
        stack.append(node)
    } else {
        return res
    }
    
    while (stack.isEmpty == false) {
        var temp = [TreeNode]()
        temp = stack
        stack.removeAll()
        var curr = [Int]()
        for item in temp {
            curr.append(item.val)
            if let left = item.left {
                stack.append(left)
            }
            if let right = item.right {
                stack.append(right)
            }
        }
        res.append(curr)
        
    }
    return res
}

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var res = [[Int]]()
        
    func dfs(_ node: TreeNode?, _ height: Int) {
        guard let curr = node else {return}
        if height == res.count {
            res.append([])
        }
        res[height].append(curr.val)
        if let left = curr.left {
            dfs(left,height+1)
        }
        if let right = curr.right {
            dfs(right,height+1)
        }
        
    }
    dfs(root,0)
    return res
}

    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let node = root else {return []}
        var res = [[Int]]()
        var queue = [node]
        while queue.isEmpty == false {
            let temp = queue
            queue.removeAll()
            var curr = [Int]()
            for node in temp {
                curr.append(node.val)
                if node.left != nil {queue.append(node.left!)}
                if node.right != nil {queue.append(node.right!)}
            }
            res.append(curr)
        }
        return res
    }