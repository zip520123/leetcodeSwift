//Binary Tree Right Side View
//O(n) O(w)
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let node = root else {return []}
        
        var stack = [node]
        var res = [Int]()
        while stack.isEmpty == false {
            let temp = stack
            stack.removeAll()
            res.append(temp.last!.val)
            for curr in temp {
                if curr.left != nil {stack.append(curr.left!)}
                if curr.right != nil {stack.append(curr.right!)}
            }
            
        }
        return res
    }