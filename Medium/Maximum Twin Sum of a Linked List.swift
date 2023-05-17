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

//O(n), O(1)
    func pairSum(_ head: ListNode?) -> Int {
        var fast = head
        var slow = head
        while fast != nil, fast!.next != nil, fast!.next!.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
        }
        let mid = slow!.next
        slow!.next = nil
        var prev: ListNode?
        var curr = mid
        while curr != nil {
            let temp = curr!.next
            curr!.next = prev
            prev = curr
            curr = temp
        }
        curr = head
        var res = 0
        while prev != nil {
            res = max(res, prev!.val + curr!.val)
            prev = prev!.next
            curr = curr!.next
        }
        return res
    }