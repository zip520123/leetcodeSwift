//Middle of the Linked List
//O(2n), O(1)
    func middleNode(_ head: ListNode?) -> ListNode? {
        var curr = head
        var count = 0
        while curr != nil {
            count += 1
            curr = curr!.next
        }
        count /= 2   
        
        
        curr = head
        for i in 0..<count {
            curr = curr!.next
        }
        return curr
    }

//O(n), O(1)
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head, fast = head
        while fast != nil && fast!.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
        }
        return slow
    }