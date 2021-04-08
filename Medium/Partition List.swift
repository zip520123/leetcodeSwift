//Partition List
//O(n) O(1)
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var head1 = ListNode()
        var head2 = ListNode()
        let lessHead = head1
        let greaterHead = head2
        var curr = head
        while curr != nil {
            if curr!.val < x {
                head1.next = curr
                head1 = head1.next!
            } else {
                head2.next = curr
                head2 = head2.next!
            }
            curr = curr!.next
        }
        
        head1.next = greaterHead.next
        head2.next = nil
        return lessHead.next
    }