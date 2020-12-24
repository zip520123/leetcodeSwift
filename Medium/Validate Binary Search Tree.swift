/*Validate Binary Search Tree*/
//time O(n) space O(n)
func isValidBST(_ root: TreeNode?) -> Bool {
    func dfs(_ curr: TreeNode?, _ top: Int,_ bottom: Int) -> Bool{
        if curr == nil {return true}
        
        if curr!.val >= top || curr!.val <= bottom {
            return false
        }
        
        let left = dfs(curr!.left, curr!.val, bottom)
        let right = dfs(curr!.right, top, curr!.val)
        return left && right
    }
    
    return dfs(root,Int.max, -Int.max)
}
//time O(n) space O(n) 
func isValidBST(_ root: TreeNode?) -> Bool {
    var stack = [TreeNode]()
    var topStack = [Int]()
    var bottomStack = [Int]()
    if let node = root {
        stack.append(node)
        topStack.append(Int.max)
        bottomStack.append(-Int.max)
    } else {
        return true
    }
    
    while stack.isEmpty == false {
        let node = stack.removeFirst()
        let top = topStack.removeFirst()
        let bottom = bottomStack.removeFirst()
        if node.val >= top || node.val <= bottom {
            return false
        }
        if let left = node.left {
            stack.append(left)
            topStack.append(node.val)
            bottomStack.append(bottom)
        }
        
        if let right = node.right {
            stack.append(right)
            topStack.append(top)
            bottomStack.append(node.val)
        }
    }
    
    return true
}