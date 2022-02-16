//Swap Nodes in Pairs
//O(n), O(1)
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let node = head else {return nil}
        if let next = node.next {
            let nextNext = next.next
            node.next = swapPairs(nextNext)
            next.next = node
            
            return next
        } else {
            return node
        }
    }