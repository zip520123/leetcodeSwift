//Convert Binary Number in a Linked List to Integer
//O(n), O(1)
    func getDecimalValue(_ head: ListNode?) -> Int {
        var res = 0
        var curr = head
        while curr != nil {
            res = res << 1
            res += curr!.val
            curr = curr!.next
        }
        return res
    }