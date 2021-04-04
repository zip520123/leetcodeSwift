//Binary Search Tree Iterator
class BSTIterator {
    private var arr = [Int]()
    init(_ root: TreeNode?) { //O(n) O(h)
        
        func dfs(_ node: TreeNode?) {
            guard let node = node else {return}
            dfs(node.left)
            arr.append(node.val)
            dfs(node.right)
        }
        
        dfs(root)
    }
    
    func next() -> Int { //O(1)
        if let first = arr.first {
            arr.removeFirst() 
            return first
        } else {
            return -1
        }
    }
    
    func hasNext() -> Bool { //O(1)
        return !arr.isEmpty
    }
}

class BSTIterator {
    
    private var curr: TreeNode? 
    private var stack = [TreeNode?]()
    
    init(_ root: TreeNode?) { //O(1)
        curr = root
    }
    
    func next() -> Int { //O(h)
        while stack.isEmpty == false || curr != nil {
            while curr != nil {
                stack.append(curr)
                curr = curr!.left
            }
            curr = stack.removeLast()
            let val = curr!.val
            curr = curr!.right
            return val
        }
        return -1
    }
    
    func hasNext() -> Bool { //O(1)
        return stack.isEmpty == false || curr != nil
    }
}

