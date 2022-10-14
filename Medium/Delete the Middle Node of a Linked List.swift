//Delete the Middle Node of a Linked List
//O(n), O(1)
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        let d = ListNode()
        d.next = head
        var curr: ListNode? = d, count = 0
        while curr != nil {
            count += 1
            curr = curr!.next
        }

        var mid = count/2
        if count%2 == 0 {
            mid-=1
        }
        curr = d
        for _ in 0..<mid {
            curr = curr!.next
        }
        curr!.next = curr!.next!.next
        return d.next
    }