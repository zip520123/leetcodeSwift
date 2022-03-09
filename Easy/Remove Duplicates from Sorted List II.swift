//Remove Duplicates from Sorted List II
//O(n), O(1)
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        var myHead = ListNode(-1000)
        myHead.next = head
        var curr = head
        var prev = myHead
        while curr != nil {
            if curr != nil && curr!.next != nil && curr!.next!.val == curr!.val {
                while curr != nil && curr!.next != nil && curr!.next!.val == curr!.val {
                    curr = curr!.next
                }
                prev.next = curr!.next
                curr = curr!.next
            } else {
                prev = curr!
                curr = curr!.next    
            }
            
        }
        return myHead.next
    }

//O(n), O(n)
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var dict = [Int: Int]()
        var curr = head
        while curr != nil {
            dict[curr!.val, default: 0] += 1
            curr = curr!.next
        }
        let res = ListNode()
        var node = res
        curr = head
        while curr != nil {
            let key = curr!.val
            let val = dict[key]!
            if val == 1 {
                let next = ListNode(key)
                node.next = next
                node = node.next!
            }
            curr = curr!.next
        }
        return res.next
    }