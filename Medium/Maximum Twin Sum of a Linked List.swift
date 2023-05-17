//Maximum Twin Sum of a Linked List
//O(n), O(n)
    func pairSum(_ head: ListNode?) -> Int {
        var arr = [Int]()
        var curr = head
        while curr != nil {
            arr.append(curr!.val)
            curr = curr!.next
        }
        var res = 0
        let n = arr.endIndex
        for i in 0..<(n/2) {
            res = max(res, arr[i]+arr[n-i-1])
        }
        return res
    }