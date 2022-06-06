//Intersection of Two Linked Lists
//O(n) O(1)
//Add two node will having the same length, they will meet at the interact eventually or both meet at the tail.
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var a = headA, b = headB
        while a !== b {
            a = a == nil ? headB : a!.next
            b = b == nil ? headA : b!.next
        }
        return a
    }

    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var a = headA, b = headB
        while a !== b {
            a = a != nil ? a!.next : headB
            b = b != nil ? b!.next : headA
        }
        return a
    }