/*Add Two Numbers*/
//O(l1+l2) O(l1+l2)
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1, l2 = l2
        let head : ListNode? = ListNode()
        var curr = head, carry = 0
        while l1 != nil && l2 != nil {
            var val = l1!.val + l2!.val + carry
            carry = val / 10
            val = val % 10
            let node = ListNode(val)
            curr!.next = node
            curr = curr!.next
            l1 = l1!.next
            l2 = l2!.next
        }
        
        while l1 != nil {
            var val = l1!.val + carry
            carry = val / 10
            val = val % 10
            let node = ListNode(val)
            curr!.next = node
            curr = curr!.next
            l1 = l1!.next
        }
        
        while l2 != nil {
            var val = l2!.val + carry
            carry = val / 10
            val = val % 10
            let node = ListNode(val)
            curr!.next = node
            curr = curr!.next
            l2 = l2!.next
        }
        
        if carry != 0 {
            curr!.next = ListNode(carry)
        }
        
        return head!.next
    }