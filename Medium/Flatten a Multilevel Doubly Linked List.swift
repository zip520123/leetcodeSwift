//Flatten a Multilevel Doubly Linked List
//O(n),O(n) The linked list [1,2,3,7,8,11,12,9,10,4,5,6] is not a valid doubly linked list.
class Solution {
    
    func flatten(_ head: Node?) -> Node? {
        dfs(head)
        return head
    }
    
    func dfs(_ head: Node?) -> Node? {
        var curr = head
        while curr?.next != nil || curr?.child != nil {
            if curr?.child != nil {
                let temp = curr?.next
                let end = dfs(curr!.child!)
                curr!.next = curr!.child
                curr!.child!.prev = curr
                curr!.child = nil
                temp?.prev = end
                end?.next = temp
            }
            curr = curr?.next
        }
        return curr
    }
}
//Work
    func flatten(_ head: Node?) -> Node? {

        var curr = head
        while curr != nil {
            if curr!.child == nil {
                curr = curr!.next
                continue
            }
            var temp = curr!.child
            while temp!.next != nil {
                temp = temp!.next!
            }
            temp!.next = curr!.next
            if curr!.next != nil {
                curr!.next!.prev = temp
            }
            curr!.next = curr!.child
            curr!.child!.prev = curr
            curr!.child = nil
        }
        return head
    }