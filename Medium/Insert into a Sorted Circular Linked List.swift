//Insert into a Sorted Circular Linked List
    func insert(_ head: Node?, _ insertVal: Int) -> Node? {
        if head == nil {
            let node = Node(insertVal)
            node.next = node
            return node
        }
        var curr = head!
        while true {
            if curr.val <= insertVal && insertVal <= curr.next!.val {
                break
            }
            if curr.val > curr.next!.val { //last element
                if insertVal >= curr.val || insertVal <= curr.next!.val { //value geater than last, or smaller than first
                    break
                }
            }
            curr = curr.next!
            if curr === head {  //all elements are equal
                break
            }
        }
        let node = Node(insertVal)
        let temp = curr.next
        curr.next = node
        node.next = temp
        return head
    }
