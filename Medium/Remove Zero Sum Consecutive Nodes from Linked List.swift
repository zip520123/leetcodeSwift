// Remove Zero Sum Consecutive Nodes from Linked List
// O(n^2), O(1)
func removeZeroSumSublists(_ head: ListNode?) -> ListNode? {
    var root = ListNode(0, head)
    var curr: ListNode? = root
    while curr != nil {
        var end = curr!.next
        var prefixSum = 0
        while end != nil {
            prefixSum += end!.val
            if prefixSum == 0 {
                curr!.next = end!.next
            }
            end = end!.next
        }
        curr = curr!.next
    }
    return root.next
}