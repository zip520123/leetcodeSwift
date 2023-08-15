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

    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var lessHead = ListNode()
        var lessList: ListNode? = lessHead
        
        var greaterHead = ListNode()
        var greaterEqualList: ListNode? = greaterHead
        
        var curr = head
        while curr != nil {
            if curr!.val < x {
                lessList!.next = curr
                curr = curr!.next
                lessList = lessList!.next
            } else {
                greaterEqualList!.next = curr
                curr = curr!.next
                greaterEqualList = greaterEqualList!.next
            }
        }
        
        lessList!.next = greaterHead.next
        greaterEqualList!.next = nil  //prevent cycle
        return lessHead.next
        
    }
// O(n), O(1)
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        guard let root = head else { return nil }
        var t = ListNode()
        let tHead = t
        var curr: ListNode? = root
        var d = ListNode()
        let dHead = d
        while curr != nil {
            if curr!.val < x {
                d.next = curr
                curr = curr!.next
                d = d.next!
                d.next = nil
            } else {
                t.next = curr
                curr = curr!.next
                t = t.next!
                t.next = nil
            }
        }
        d.next = tHead.next
        return dHead.next
    }