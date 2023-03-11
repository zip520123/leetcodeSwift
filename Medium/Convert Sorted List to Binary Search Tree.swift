//Convert Sorted List to Binary Search Tree
//O(n log n) O(n)
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        if head == nil {return nil}
        return sortedBST(head, nil)
        
    }
    
    func sortedBST(_ head: ListNode?, _ tail: ListNode?) -> TreeNode? {
        if head === tail { return nil }
        var slow = head
        var fast = head
        
        while !(fast === tail) && !(fast?.next === tail) {
            fast = fast?.next?.next
            slow = slow?.next
        }

        let node = TreeNode(slow!.val)
        
        node.left = sortedBST(head, slow)
        node.right = sortedBST(slow?.next, tail)
        return node
        
    }

//O(n log n) O(n)
    func sortedListToBST(_ head: ListNode?) -> TreeNode? { 
        if head == nil {return nil}
        if head!.next == nil {return TreeNode(head!.val)}
        var fast = head
        var slow = head
        var prev: ListNode?
        while fast!.next != nil && fast!.next!.next != nil {
            prev = slow
            slow = slow!.next
            fast = fast!.next!.next
        }
        prev?.next = nil
        let node = TreeNode(slow!.val)
        if head !== slow {
            node.left = sortedListToBST(head)
        }
        node.right = sortedListToBST(slow!.next)
        return node
    }

//O(n log n), O(n)
class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard let node = head else {return nil}
        var arr = [Int]()    
        var curr: ListNode? = head
        while curr != nil {
            arr.append(curr!.val)
            curr = curr!.next
        }
        return createTreeNode(arr)
    }

    func createTreeNode(_ arr: [Int]) -> TreeNode? {
        if arr.count == 0 {return nil}
        if arr.count == 1 {
            return TreeNode(arr[0], nil, nil)
        }
        let node = TreeNode(arr[arr.endIndex/2])
        let left = createTreeNode(Array(arr[0..<arr.endIndex/2]))
        let right = createTreeNode(Array(arr[arr.endIndex/2+1..<arr.endIndex]))
        node.left = left
        node.right = right
        return node
    }
}