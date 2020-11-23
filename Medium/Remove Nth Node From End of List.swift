/*Remove Nth Node From End of List*/
//time O(n) space O(1)
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let dummy = ListNode()
    dummy.next = head
    var curr : ListNode? = dummy
    var count = 0
    while(curr != nil) {
        curr = curr!.next
        count += 1
    } 
    
    count -= n
    count -= 1
    curr = dummy
    while count > 0 {
        count -= 1
        curr = curr!.next
    }
    curr!.next = curr!.next!.next    
    return dummy.next
}
//time O(n) space O(n)
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let dummy = ListNode()
    dummy.next = head
    var curr : ListNode? = dummy
    var nodes = [ListNode]()
    while(curr != nil) {
        nodes.append(curr!)
        curr = curr!.next
    }
    
    let ncount = nodes.count
    let node = nodes[ncount - n - 1]
    if node.next != nil {
        node.next = node.next!.next    
    }
    
    return dummy.next
}