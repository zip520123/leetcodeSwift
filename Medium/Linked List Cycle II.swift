/*Linked List Cycle II*/
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head, fast = head
        while fast != nil && fast!.next != nil  {
            slow = slow!.next
            fast = fast!.next!.next
            if slow === fast {break}
        }
        if fast == nil || fast!.next == nil {return nil}
        fast = head
        while slow !== fast {
            fast = fast!.next
            slow = slow!.next
        }
        return slow
    }