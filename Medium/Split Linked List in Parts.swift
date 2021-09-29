// Split Linked List in Parts
//O(n), O(1)
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
        var allCount = 0
        var curr = head
        while curr != nil {
            allCount += 1
            curr = curr!.next
        }
        var res = [ListNode?]()
        let n = allCount/k
        curr = head
        for i in 0..<k {
            var count = n
            if i < allCount % k {
                count += 1
            }
            res.append(curr)
            var prev = curr
            for j in 0..<count {
                prev = curr
                curr = curr?.next
            }
            prev?.next = nil
        }
        
        return res
    }