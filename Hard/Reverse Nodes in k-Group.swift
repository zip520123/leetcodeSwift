//Reverse Nodes in k-Group
//O(n), O(1)
class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let d = ListNode()
        d.next = head
        var curr = d.next, count = 1
        var start = d, point = curr
        while point != nil {
            point = point!.next
            count += 1
            if count == k && point != nil {
                let end = point!.next
                start.next = nil
                point!.next = nil
                let list = reverse(curr)
                start.next = list
                curr!.next = end
                start = curr!
                curr = start.next
                point = curr
                count = 1
            }
        }
        return d.next
    }
    
    func reverse(_ head: ListNode?) -> ListNode? {
        if head == nil {return head}
        var prev: ListNode?
        var curr = head
        while curr != nil {
            let next = curr!.next
            curr!.next = prev
            prev = curr
            curr = next
        }
        return prev
    }
}