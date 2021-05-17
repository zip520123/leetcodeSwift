/*Linked List Cycle*/
//time O(n) space O(1)
func hasCycle(_ head: ListNode?) -> Bool {
    if head == nil {return false}
    
    var fast = head
    var slow = head
    while fast != nil && slow != nil {
        if fast!.next == nil {return false}
        slow = slow!.next
        fast = fast!.next!.next
        if fast === slow {return true}
    }
    return false
}

    func hasCycle(_ head: ListNode?) -> Bool {
        var fast = head
        var slow = head
        while fast?.next != nil && fast?.next?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            
            if fast === slow {return true}
        }
        return false
    }