//Remove Linked List Elements
//O(n) O(1)
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var dummy = ListNode()
        dummy.next = head
        var curr: ListNode? = dummy
        while curr != nil && curr!.next != nil {
            if curr!.next!.val == val {
                curr!.next = curr!.next!.next
            } else {
                curr = curr!.next!
            }
        }
        return dummy.next
    }

    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var prev = ListNode()
        let dammy = prev
        prev.next = head
        var curr = head
        while curr != nil {
            if curr!.val == val {
                prev.next = curr!.next
            } else {
                prev = curr!
            }
            curr = curr!.next
        }
        return dammy.next
    }