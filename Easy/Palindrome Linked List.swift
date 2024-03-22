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

// O(n), O(n)
    func isPalindrome(_ head: ListNode?) -> Bool {
        var arr = [Int]()
        var curr = head
        while curr != nil {
            arr.append(curr!.val)
            curr = curr!.next
        }
        var l = 0, r = arr.endIndex-1
        while l<r {
            if arr[l] != arr[r] {
                return false
            }
            l += 1
            r -= 1
        }
        return true
    }