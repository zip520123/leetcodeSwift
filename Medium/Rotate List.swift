//Rotate List
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || head?.next == nil {return head}
        var last = head!, n = 1
        while last.next != nil {
            last = last.next!
            n += 1
        }
        if k % n == 0 {return head}
        var middle = head!
        for _ in 0..<(n-k%n-1) {
            middle = middle.next!
        }
        let newHead = middle.next
        last.next = head
        middle.next = nil
        return newHead
    }