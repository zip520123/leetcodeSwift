//Convert Sorted List to Binary Search Tree
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard let head = head else {
            return nil
        }
        
        return sortedListToBST(from: head, to: nil)
    }
    
    func sortedListToBST(from head: ListNode?, to tail: ListNode?) -> TreeNode? {
        if head === tail {
            return nil
        }
        
        var fast = head
        var slow = head
        
        while !(fast === tail) && !(fast?.next === tail) {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        let root = TreeNode(slow!.val)
        root.left = sortedListToBST(from: head, to: slow)
        root.right = sortedListToBST(from: slow?.next, to: tail)
        
        return root
    }