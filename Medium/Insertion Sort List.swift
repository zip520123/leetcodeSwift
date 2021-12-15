//Insertion Sort List
//O(n^2), O(1)
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        let d = ListNode()
        var curr = head
        while curr != nil {
            let temp = curr!.next
            curr!.next = nil
            var p = d.next
            var prev = d
            while p != nil && p!.val < curr!.val {
                prev = p!
                p = p!.next
            }
            prev.next = curr
            curr!.next = p
            curr = temp
        }
        
        return d.next
    }