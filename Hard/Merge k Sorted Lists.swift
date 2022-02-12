/*Merge k Sorted Lists*/
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

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    
    var arr = [Int]()
    for list in lists {
        var curr: ListNode? = list 
        while curr != nil {
            arr.append(curr!.val)
            curr = curr!.next
        }
    }
    
    let sortedArr = arr.sorted(by: <)
    var head = ListNode()
    var curr: ListNode? = head
    for n in sortedArr {
        curr!.next = ListNode(n)
        curr = curr!.next
    }
    return head.next
}
