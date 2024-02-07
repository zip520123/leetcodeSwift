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
        var head: Node?
        var prev: Node?
        
        func dfs(_ node: Node?) {
            guard let node else {return}
            dfs(node.left)
            if head == nil { head = node }
            node.left = prev
            prev?.right = node
            prev = node
            dfs(node.right)
        }
        
        dfs(root)

        head?.left = prev
        prev?.right = head
        return head
    }

//O(n), O(n)
    func treeToDoublyList(_ root: Node?) -> Node? {
        guard let root else {return nil}
        var stack = [Node]()
        var curr: Node? = root
        var prev: Node?
        var head: Node?
        while !stack.isEmpty || curr != nil {
            while curr != nil {
                stack.append(curr!)
                curr = curr!.left
            }
            curr = stack.removeLast()
            if head == nil { head = curr }
            curr!.left = prev
            prev?.right = curr
            prev = curr
            curr = curr!.right
        }
        prev?.right = head
        head?.left = prev
        return head
    }