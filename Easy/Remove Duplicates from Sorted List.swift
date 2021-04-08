//Remove Duplicates from Sorted List
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var curr = head 
        while curr != nil {
            while curr!.next != nil && curr!.next!.val == curr!.val{
                curr!.next = curr!.next!.next
            }
            curr = curr!.next
        }
        return head
    }