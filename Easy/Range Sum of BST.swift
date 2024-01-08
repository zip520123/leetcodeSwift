//Range Sum of BST
//O(n) O(n)
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let node = root else {return 0}
        
        let left = low > node.val ? 0 : rangeSumBST(node.left,low,high)
        let right = high < node.val ? 0 : rangeSumBST(node.right,low,high)
        var res = left + right
        if node.val >= low && node.val <= high {
            res += node.val
        }
        return res
    }

    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let node = root else {return 0}
        var queue = [node]
        var res = 0
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            if node.val >= low && node.val <= high {
                res += node.val
            }
            if node.val >= low && node.left != nil {
                queue.append(node.left!)
            }
            if node.val <= high && node.right != nil {
                queue.append(node.right!)
            }
        }
        return res
    }

    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let node = root else {return 0}
        
        let left = rangeSumBST(node.left, low, high)
        let right = rangeSumBST(node.right, low, high)
        let curr = node.val >= low && node.val <= high ? node.val : 0
        return left + right + curr
    }

    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let node = root else {return 0}
        var queue = [node]
        var res = 0
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if node.val >= low && node.val <= high {
                res += node.val
            }
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        return res
    }

    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root else {return 0}
        var res = 0
        if root.val >= low && root.val <= high {
            res += root.val
        }
        return res + rangeSumBST(root.left, low, high) + rangeSumBST(root.right, low, high)
    }

    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root else {return 0}
        var res = 0
        var q = [root]
        while !q.isEmpty {
            let temp = q
            q = []
            for node in temp {
                if node.val >= low, node.val <= high {
                    res += node.val
                }
                if node.left != nil && node.val >= low {q.append(node.left!)}
                if node.right != nil && node.val <= high {q.append(node.right!)}
            }
        }
        return res
    }