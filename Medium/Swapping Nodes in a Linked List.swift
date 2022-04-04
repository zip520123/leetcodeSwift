//Swapping Nodes in a Linked List
//O(n), O(1)
    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        var curr = head, count = 0
        var left: ListNode? 
        while curr != nil {
            count += 1
            if count == k {
                left = curr
            }
            curr = curr!.next
        }
        var fromEnd = count - k
        var right: ListNode?
        curr = head
        for _ in 0..<fromEnd {
            curr = curr!.next
        }
        right = curr
        let temp = left!.val
        left!.val = right!.val
        right!.val = temp
        return head
    }