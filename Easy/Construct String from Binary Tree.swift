//Construct String from Binary Tree
//O(n), O(h)
    func tree2str(_ t: TreeNode?) -> String {
        guard let node = t else {return ""}
        var res = String(node.val)
        if node.left == nil && node.right == nil {
            
        } else {
            res += "(" + tree2str(node.left) + ")"    
            if node.right != nil {
                res += "(" + tree2str(node.right) + ")"        
            }
        }
        
        return res
    }

//O(n), O(h)
    func tree2str(_ root: TreeNode?) -> String {
        guard let node = root else {return ""}
        var res = String(node.val)
        if node.left != nil || node.right != nil {
            res += "(" + tree2str(node.left) + ")"
            if node.right != nil {
                res += "(" + tree2str(node.right) + ")"
            }
        }
        return res
    }

//O(n), O(h)
    func tree2str(_ root: TreeNode?) -> String {
        guard let node = root else {return ""}
        let left = tree2str(node.left)
        let right = tree2str(node.right)
        var res = String(node.val)
        if left != "" {
            res += "(" + left + ")"
        } else if right != "" {
            res += "()"
        }
        if right != "" {
            res += "(" + right + ")"
        }
        return res
    }