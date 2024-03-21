// Merge In Between Linked Lists
// O(n), O(1)
func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
    var head = ListNode(0, list1)
    var curr: ListNode? = head
    var start: ListNode?
    for i in 0...b {
        if i == a { start = curr }
        curr = curr!.next
    }
    let end = curr!.next
    start!.next = list2
    curr = list2
    var prev: ListNode?
    while curr != nil {
        prev = curr
        curr = curr!.next
    }
    prev!.next = end
    return head.next
}