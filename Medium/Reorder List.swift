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