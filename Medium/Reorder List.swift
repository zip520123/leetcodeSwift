/*Reorder List*/
//time O(2n) space O(1)
func reorderList(_ head: ListNode?) {
    if head == nil {return}
    var slow = head
    var fast = head
    while fast != nil && fast!.next != nil{
        fast = fast!.next!.next
        slow = slow!.next
    }
    var mid = slow!.next
    slow!.next = nil
    
    var prev : ListNode? = nil
    var curr = mid 
    while curr != nil {
        var next = curr!.next
        curr!.next = prev
        prev = curr
        curr = next
    }
    
    var l1 = head
    var l2 = prev
    while l2 != nil {
        let temp = l1!.next
        l1!.next = l2
        l1 = l2
        l2 = temp    
    }
    
}

    func reorderList(_ head: ListNode?) {
        guard let head = head else {return}
        
        var slow = head
        var fast = head
        while fast.next != nil && fast.next!.next != nil {
            slow = slow.next!
            fast = fast.next!.next!
        }
        let mid = slow.next
        slow.next = nil
        var prev: ListNode?
        var curr: ListNode? = mid
        while curr != nil {
            let temp = curr!.next
            curr!.next = prev
            prev = curr
            curr = temp
        }
        
        var l2: ListNode? = prev
        var l1: ListNode? = head
        curr = ListNode()
        while l1 != nil || l2 != nil {
            if l1 != nil {
                curr!.next = l1
                l1 = l1!.next
                curr = curr!.next
            }
            if l2 != nil {
                curr!.next = l2
                l2 = l2!.next
                curr = curr!.next
            }
        }
        if l1 != nil {
            curr!.next = l1
        }
        if l2 != nil {
            curr!.next = l2
        }
        
    }

    func reorderList(_ head: ListNode?) {
        guard let head = head else {return}
        
        var slow = head
        var fast = head
        while fast.next != nil && fast.next!.next != nil {
            slow = slow.next!
            fast = fast.next!.next!
        }
        let mid = slow.next
        slow.next = nil
        var prev: ListNode?
        var curr: ListNode? = mid
        while curr != nil {
            let temp = curr!.next
            curr!.next = prev
            prev = curr
            curr = temp
        }
        
        var l2: ListNode? = prev
        var l1: ListNode? = head
        
        while l2 != nil {
            let temp = l1?.next
            l1?.next = l2
            l1 = l1?.next
            l2 = temp
        }
        
    }