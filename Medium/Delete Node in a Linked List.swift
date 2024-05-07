//Delete Node in a Linked List
//O(n), O(1)
    func deleteNode(_ node: ListNode?) {
        guard let node = node else {return}
        var curr = node, next = node.next
        while next != nil {
            curr.val = next!.val
            if next?.next == nil {
                curr.next = nil
                break
            }
            curr = next!
            next = next!.next
        }
        
    }

// O(n), O(1)
func deleteNode(_ node: ListNode?) {
    var curr = node
    var prev: ListNode?
    while curr != nil, curr!.next != nil {
        prev = curr
        curr!.val = curr!.next!.val
        curr = curr!.next
    }
    prev!.next = nil
}