/*Reverse Linked List*/
func reverseList(_ head: ListNode?) -> ListNode? {
    var prev: ListNode? = nil
    var curr = head
    while curr != nil {
        var temp = curr!.next
        curr!.next = prev
        prev = curr
        
        curr = temp
    }
    return prev
}