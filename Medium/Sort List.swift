//Sort List
//O(n log n) O(log n)
class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else {return head}
        var slow: ListNode? = head
        var fast: ListNode? = head
        while fast != nil && fast!.next != nil && fast!.next!.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
        }
        var l1 = head, l2 = slow!.next
        slow!.next = nil
        let left = sortList(l1)
        let right = sortList(l2)
        return merge(left, right)
    }
    
    func merge(_ l1: ListNode?, _ l2:ListNode?) -> ListNode? {
        if l1 == nil {return l2}
        if l2 == nil {return l1}
        var l1 = l1, l2 = l2
        var head = ListNode()
        var curr: ListNode? = head
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                curr!.next = l1
                l1 = l1!.next
            } else {
                curr!.next = l2
                l2 = l2!.next
            }
            curr = curr!.next
        }
        while l1 != nil {
            curr!.next = l1
            l1 = l1!.next
            curr = curr!.next
        }
        while l2 != nil {
            curr!.next = l2
            l2 = l2!.next
            curr = curr!.next
        }
        return head.next
    }
    
}