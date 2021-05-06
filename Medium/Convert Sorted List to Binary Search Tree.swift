//Convert Sorted List to Binary Search Tree
//O(n log n) O(n)
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        if head == nil {return nil}
        return sortedBST(head, nil)
        
    }
    
    func sortedBST(_ head: ListNode?, _ tail: ListNode?) -> TreeNode? {
        if head === tail { return nil }
        var slow = head
        var fast = head
        
        while !(fast === tail) && !(fast?.next === tail) {
            fast = fast?.next?.next
            slow = slow?.next
        }

        let node = TreeNode(slow!.val)
        
        node.left = sortedBST(head, slow)
        node.right = sortedBST(slow?.next, tail)
        return node
        
    }

//O(n log n) O(n)
    func sortedListToBST(_ head: ListNode?) -> TreeNode? { 
        if head == nil {return nil}
        if head!.next == nil {return TreeNode(head!.val)}
        var fast = head
        var slow = head
        var prev: ListNode?
        while fast!.next != nil && fast!.next!.next != nil {
            prev = slow
            slow = slow!.next
            fast = fast!.next!.next
        }
        prev?.next = nil
        let node = TreeNode(slow!.val)
        let mid = slow!.next
        slow!.next = nil
        if slow !== head {
            node.left = sortedListToBST(head)
        } 
        node.right = sortedListToBST(mid)
        return node

    }