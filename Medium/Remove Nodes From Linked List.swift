// Remove Nodes From Linked List
// O(n), O(n)
func removeNodes(_ head: ListNode?) -> ListNode? {
    var queue = [ListNode]()
    let dummy = ListNode(Int.max)
    queue.append(dummy)
    var curr = head
    while curr != nil {
        while !queue.isEmpty && queue.last!.val < curr!.val {
            queue.removeLast()
        }
        queue.append(curr!)
        curr = curr!.next
    }
    var prev = queue.removeFirst()
    for node in queue {
        prev.next = node
        prev = node
    }
    return dummy.next
}