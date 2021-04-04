//Insert into a Binary Search Tree
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let node = root else {return TreeNode(val)}
        if node.val > val {
            node.left = insertIntoBST(node.left,val)
        } else {
            node.right = insertIntoBST(node.right,val)
        }
        return node
    }

    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let node = root else {return TreeNode(val)}
        var curr: TreeNode? = node
        while true {
            if curr!.val > val {
                if curr!.left != nil {
                    curr = curr!.left
                } else {
                    curr!.left = TreeNode(val)
                    break
                }
            } else {
                if curr!.right != nil {
                    curr = curr!.right
                } else {
                    curr!.right = TreeNode(val)
                    break
                }
            }
        }
        return root
    }