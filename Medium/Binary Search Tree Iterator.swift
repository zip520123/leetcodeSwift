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
    var stack = [TreeNode]()
    var curr: TreeNode?
    init(_ root: TreeNode?) {
        curr = root
    }
    
    func next() -> Int {  //O(h), h = tree.height
        while curr != nil {
            stack.append(curr!)
            curr = curr!.left
        }
        let node = stack.removeLast()
        curr = node.right
        return node.val
    }
    
    func hasNext() -> Bool {
        !stack.isEmpty || curr != nil
    }
}

