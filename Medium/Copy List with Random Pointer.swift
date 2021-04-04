/*Copy List with Random Pointer*/
    func copyRandomList(_ head: Node?) -> Node? {
        var curr = head
        
        var dict = [Node:Node]()
        while curr != nil {
            dict[curr!] = Node(curr!.val)
            curr = curr!.next
        }
        
        curr = head
        while curr != nil {
            let cloneNode = dict[curr!]!
            if let next = curr!.next {
                cloneNode.next = dict[next]
            }
            if let random = curr!.random {
                cloneNode.random = dict[random]
            }
            curr = curr!.next
        }
        
        return head == nil ? nil : dict[head!]
    }