//Inorder Successor in BST
//O(n) O(h)
    func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode?) -> TreeNode? {
        guard let node = root else {return nil}
        var curr: TreeNode? = node
        var stack = [TreeNode]()
        var found = false
        while stack.isEmpty == false || curr != nil {
            while curr != nil {
                stack.append(curr!)
                curr = curr!.left
            }
            curr = stack.removeLast()
            if found == true {
                return curr
            }
            if curr!.val == p!.val {
                found = true
            }
            curr = curr!.right
        }
        return nil
    }

//bineary search successor
    func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode?) -> TreeNode? {
        var res : TreeNode?
        var curr = root
        while curr != nil {
            if curr!.val > p!.val {
                res = curr
                curr = curr!.left
            } else {
                
                curr = curr!.right
            }
        }
        return res
    }

    func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode?) -> TreeNode? {
        guard let node = root else {return nil}
        if node.val > p!.val {
            let left = inorderSuccessor(node.left, p)
            if left == nil {
                return node
            } else {
                return left    
            }
        } else {
            return inorderSuccessor(node.right, p)
        }
    }