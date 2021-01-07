/*Reverse Linked List*/
//time O(n) space O(1)
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
//recursive time O(n) space O(1)
func reverseList(_ head: ListNode?) -> ListNode? {
    if head == nil || head!.next == nil{
        return head
    }
    var node = reverseList(head!.next)
    head!.next!.next = head
    head!.next = nil
    return node
}