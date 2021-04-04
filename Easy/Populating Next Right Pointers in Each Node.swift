//Populating Next Right Pointers in Each Node
//O(n) O(h)
    func connect(_ root: Node?) -> Node? {
        guard let node = root else {return nil}
        var queue = [node]
        
        while queue.isEmpty == false {
            let temp = queue
            queue.removeAll()
            var curr = temp.first!
            if curr.left != nil {queue.append(curr.left!)}
            if curr.right != nil {queue.append(curr.right!)}
            var i = 1
            while i < temp.endIndex  {
                let next = temp[i]
                if next.left != nil {queue.append(next.left!)}
                if next.right != nil {queue.append(next.right!)}
                
                curr.next = next
                curr = next
                i+=1
            }
            
        }
        
        return root
    }
//O(n) O(1)
    func connect(_ root: Node?) -> Node? {
        var levelRoot = root
        while levelRoot != nil && levelRoot?.left != nil {
            var curr = levelRoot
            while curr != nil {
                curr?.left?.next = curr?.right
                curr?.right?.next = curr?.next?.left
                curr = curr?.next
            }
            levelRoot = levelRoot?.left
        }
        return root
    }