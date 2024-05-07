// Double a Number Represented as a Linked List
// O(n), O(1)
    func doubleIt(_ head: ListNode?) -> ListNode? {
        let newHead = revert(head)
        var carry = 0
        var curr = newHead
        var prev: ListNode?
        while curr != nil {
            let val = curr!.val * 2 + carry
            curr!.val = val % 10
            carry = val / 10
            prev = curr
            curr = curr!.next
        }
        if carry > 0 {
            let newNode = ListNode(carry)
            prev!.next = newNode
        }
        return revert(newHead)
    }

    func revert(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var curr = head
        while curr != nil {
            let temp = curr!.next
            curr!.next = prev
            prev = curr
            curr = temp
        }
        return prev
    }