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