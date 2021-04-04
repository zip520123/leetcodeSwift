//Symmetric Tree
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {return true}
        var leftQueue = [root!]
        var rightQueue = [root!]
        while !leftQueue.isEmpty && !rightQueue.isEmpty {
            let leftNode = leftQueue.removeFirst()
            let rightNode = rightQueue.removeFirst()
            if leftNode.val != rightNode.val {return false}
            if leftNode.left != nil && rightNode.right != nil {
                leftQueue.append(leftNode.left!)
                rightQueue.append(rightNode.right!)
            }
            if leftNode.right != nil && rightNode.left != nil {
                leftQueue.append(leftNode.right!)
                rightQueue.append(rightNode.left!)
            }
            if leftNode.left != nil && rightNode.right == nil {
                return false
            }
            if leftNode.right != nil && rightNode.left == nil {
                return false
            }
            if rightNode.left != nil && leftNode.right == nil {
                return false
            }
            if rightNode.right != nil && leftNode.left == nil {
                return false
            }
        }
        return true
    }

    func isSymmetric(_ root: TreeNode?) -> Bool {
        
        var leftQueue = [root]
        var rightQueue = [root]
        while !leftQueue.isEmpty && !rightQueue.isEmpty {
            let leftNode = leftQueue.removeFirst()
            let rightNode = rightQueue.removeFirst()
            if leftNode == nil && rightNode == nil {continue}
            if leftNode == nil || rightNode == nil {return false}
            if leftNode!.val != rightNode!.val {return false}
            leftQueue.append(leftNode!.left)
            rightQueue.append(rightNode!.right)
            leftQueue.append(leftNode!.right)
            rightQueue.append(rightNode!.left)

        }
        return true
    }