/*Odd Even Linked List*/
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil {return nil}
        var odd = head
        var even = head!.next
        let evenHead = even
        while even != nil && even!.next != nil {
            odd!.next = even!.next
            odd = odd!.next
            even!.next = odd!.next
            even = even!.next
            
        }
        odd!.next = evenHead
        return head
    }

//O(n),O(1)
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        guard let node = head else {return nil}
        var first: ListNode = node, second: ListNode? = first.next
        let evenHead = second
        while second?.next != nil {
            first.next = second!.next!
            first = first.next!
            
            second!.next = first.next
            second = second!.next
        }
        first.next = evenHead

        return head
    }