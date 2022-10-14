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

//O(n), O(1)
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        let d = ListNode()
        d.next = head
        var fast: ListNode = d, slow: ListNode = d
        while fast.next != nil, fast.next!.next != nil {
            slow = slow.next!
            fast = fast.next!.next!
        }
        slow.next = slow.next!.next
        return d.next
    }