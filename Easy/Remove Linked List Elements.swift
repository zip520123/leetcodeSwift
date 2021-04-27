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