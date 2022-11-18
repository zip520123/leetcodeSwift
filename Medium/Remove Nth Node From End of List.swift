/*Remove Nth Node From End of List*/
//time O(n) space O(1)
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var count = 0 
    var curr = head

    while curr != nil {
        curr = curr!.next
        count += 1
    }
    let d = ListNode()
    d.next = head
    curr = d
    for _ in 0..<(count-n) {
        curr = curr?.next
    }
    curr?.next = curr?.next?.next
    return d.next
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
//dict O(n) O(n)
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let dummy = ListNode()
    dummy.next = head
    var curr = head
    var count = 0
    var dict = [Int:ListNode]()
    dict[-1] = dummy
    while curr != nil {
        dict[count] = curr!
        curr = curr!.next
        count += 1
    }
    let node = dict[count - n - 1]!
    node.next = node.next?.next
    return dummy.next
}