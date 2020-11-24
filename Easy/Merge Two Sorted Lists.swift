/*Merge Two Sorted Lists*/
public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1, l2 = l2

    let dummy = ListNode()
    var curr : ListNode? = dummy
    while(l1 != nil && l2 != nil) {
        if l1!.val < l2!.val {
            curr?.next = l1
            l1 = l1!.next
            
        } else {
            curr!.next = l2
            l2 = l2!.next
        }
        curr = curr!.next
    }
    
    // while(l1 != nil) {
    //     curr?.next = l1
    //     l1 = l1!.next
    //     curr = curr!.next
    // }
    
    // while(l2 != nil) {
    //     curr?.next = l2
    //     l2 = l2!.next
    //     curr = curr!.next
    // }

    if (l1 != nil) {
        curr?.next = l1
    }
    
    if (l2 != nil) {
        curr?.next = l2
    }
    
    return dummy.next
}