/*Merge k Sorted Lists*/
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
//time O(kn) space O(1)
// func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
//     let dummy : ListNode? = ListNode()
//     var lists = lists
//     if lists.isEmpty {return nil}
//     dummy!.next = lists.first!
//     lists.removeFirst()
    
//     while(lists.isEmpty == false) {
//         var curr = dummy
//         var l1 = dummy!.next
//         var l2 = lists.first!
//         lists.removeFirst()
//         while(l1 != nil && l2 != nil) {
//             if l1!.val < l2!.val {
//                 curr!.next = l1
//                 l1 = l1!.next
//             } else {
//                 curr!.next = l2
//                 l2 = l2!.next
                
//             }
//             curr = curr!.next
//         }
//         if l1 != nil {
//             curr!.next = l1
//         }
//         if l2 != nil {
//             curr!.next = l2
//         }
        
//     }
//     return dummy!.next
// }

//time O(n log k) space O(1)
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    if lists.isEmpty {return nil}
    let listCount = lists.count
    if listCount == 1 {return lists[0]}
    let mid = listCount / 2
    let list1 = mergeKLists(Array(lists[0..<mid]))
    let list2 = mergeKLists(Array(lists[mid..<listCount]))
    
    return mergeList(list1, list2)
}

func mergeList(_ l1:ListNode?, _ l2:ListNode?) -> ListNode? {
    let dummy: ListNode? = ListNode()
    var curr = dummy, l1 = l1, l2 = l2
    while(l1 != nil && l2 != nil) {
        if l1!.val < l2!.val {
            curr!.next = l1
            l1 = l1!.next
        } else {
            curr!.next = l2
            l2 = l2!.next
        }
        curr = curr!.next
    }
    if l1 != nil {
        curr!.next = l1
    }
    if l2 != nil {
        curr!.next = l2
    }

    return dummy!.next
}

let input = [[1,4,5],[1,3,4],[2,6]]
var input2 = [ListNode?]()
for list in input {
    let head: ListNode = ListNode()
    var curr = head
    for item in list {
        curr.next = ListNode(item)
        curr = curr.next!
    }
    input2.append(head.next)
}

var node = mergeKLists(input2)
while(node != nil) {
    print(node!.val, terminator:" ")
    node = node!.next
}
