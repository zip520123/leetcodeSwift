// Add Two Numbers II
// O(l1+l2), O(1)
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        func reverse(_ node: ListNode?) -> ListNode? {
            var prev: ListNode?
            var curr = node
            while curr != nil {
                let temp = curr!.next
                curr!.next = prev
                prev = curr
                curr = temp
            }
            return prev
        }
        var rl1 = reverse(l1)
        var rl2 = reverse(l2)

        var carry = 0
        
        let head = ListNode()
        var curr = head
        while rl1 != nil || rl2 != nil {
            curr.next = ListNode()
            curr = curr.next!
            curr.val = ((rl1?.val ?? 0) + (rl2?.val ?? 0) + carry) % 10
            carry = ((rl1?.val ?? 0) + (rl2?.val ?? 0) + carry) / 10
            rl1 = rl1?.next
            rl2 = rl2?.next
        }

        if carry > 0 {
            curr.next = ListNode()
            curr = curr.next!
            curr.val = carry
        }
        return reverse(head.next)
    }