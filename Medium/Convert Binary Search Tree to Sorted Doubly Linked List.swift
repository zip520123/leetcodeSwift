//Convert Binary Search Tree to Sorted Doubly Linked List
//O(n) O(n)
    func treeToDoublyList(_ root: Node?) -> Node? {
        var curr = root
        var stack = [Node]()
        var dummy = Node(0)
        var prev = dummy
        while stack.isEmpty == false || curr != nil {
            while curr != nil {
                stack.append(curr!)
                curr = curr!.left
            }
            curr = stack.removeLast()
            prev.right = curr
            curr!.left = prev
            prev = curr!
            curr = curr!.right
        }
        dummy.right?.left = prev
        prev.right = dummy.right
        return dummy.right
    }
//O(n) O(n)
    func treeToDoublyList(_ root: Node?) -> Node? {
        var dummy = Node(0)
        var prev = dummy
        
        func dfs(_ node: Node?) {
            guard let node = node else {return}
            dfs(node.left)
            prev.right = node
            node.left = prev
            prev = node
            dfs(node.right)
        }
        
        dfs(root)
        
        dummy.right?.left = prev
        prev.right = dummy.right
        return dummy.right
    }