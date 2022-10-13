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