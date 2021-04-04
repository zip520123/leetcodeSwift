/*Palindrome Linked List*/
//O(n) O(1)
    func isPalindrome(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        while fast != nil && fast!.next != nil && fast!.next!.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
        }
        var curr = slow!.next
        slow!.next = nil
        
        var prev : ListNode? = nil
        while curr != nil {
            let temp = curr!.next
            curr!.next = prev
            prev = curr
            curr = temp
        }
        var l1 = head, l2 = prev
        
        while l1 != nil && l2 != nil {
            if l1!.val != l2!.val {return false}
            l1 = l1!.next
            l2 = l2!.next
        }
        
        
        return true
    }