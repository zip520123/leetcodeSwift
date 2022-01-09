//Linked List Random Node

class Solution {
    var arr = [Int]()
    init(_ head: ListNode?) { //O(n)
        var curr = head
        while curr != nil {
            arr.append(curr!.val)
            curr = curr!.next
        }        
    }
    
    func getRandom() -> Int { //O(1)
        arr[Int.random(in: 0..<arr.endIndex)]
    }
}
