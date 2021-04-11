//Construct String from Binary Tree
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