//Reverse Linked List II
//O(n), O(1)
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if head == nil {return nil}
        let d = ListNode(0)
        d.next = head
        var prev: ListNode? = d
        for i in 0..<left-1 {
            prev = prev?.next
        }
        var start = prev?.next
        var end = start?.next
        for i in 0..<right-left {
            start?.next = end?.next
            end?.next = prev?.next
            prev?.next = end
            end = start?.next
        }
        return d.next
    }