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