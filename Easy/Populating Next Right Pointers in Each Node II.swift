//Populating Next Right Pointers in Each Node II
//O(n) O(n)
    func connect(_ root: Node?) -> Node? {
        guard let node = root else {return nil} 
        var queue = [node]
        while queue.isEmpty == false {
            var temp = queue
            queue.removeAll()
            var curr = temp.removeFirst()
            if curr.left != nil {queue.append(curr.left!)}
            if curr.right != nil {queue.append(curr.right!)}
            for node in temp {
                curr.next = node
                curr = node
                if node.left != nil {queue.append(node.left!)}
                if node.right != nil {queue.append(node.right!)}
            }
        }
        return node  
    }

    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        var queue = [root]
        while queue.count > 0 {
            for i in 0..<queue.count-1 {
                queue[i].next = queue[i+1]
            }
            queue = queue.flatMap {
                [$0.left, $0.right].compactMap { $0 }
            }
        }
        return root
    }

//O(n), O(1)
    func connect(_ root: Node?) -> Node? {
        var head : Node? //head of the next level
        var prev: Node? //the leading node on the next level
        var curr = root //current node of current level
        while curr != nil {
            while curr != nil { //iterate on the current level
                if curr!.left != nil {
                    if prev != nil {
                        prev!.next = curr!.left    
                    } else {
                        head = curr!.left    
                    }
                    prev = curr!.left    
                } 

                if curr!.right != nil {
                    if prev != nil {
                        prev!.next = curr!.right
                    } else {
                        head = curr!.right
                    }
                    prev = curr!.right
                }
                curr = curr!.next //move to next node
           }
            
            curr = head; //move to next level
            head = nil;
            prev = nil;
        }
        return root
    }

//O(n), O(h)
    func connect(_ root: Node?) -> Node? {
        if root == nil {return nil}
        var curr = root
        var prev: Node?
        var nextHead: Node?
        while curr != nil {
            if curr!.left != nil {
                prev?.next = curr!.left
                prev = curr!.left
                if nextHead == nil {
                    nextHead = curr!.left
                }
            }
            if curr!.right != nil {
                prev?.next = curr!.right
                prev = curr!.right
                if nextHead == nil {
                    nextHead = curr!.right
                }
            }
            curr = curr!.next
        }
        connect(nextHead)
        return root
    }
    
//O(n), O(1)
    func connect(_ root: Node?) -> Node? {
        var curr = root
        var prev: Node?
        var nextHead: Node?
        while curr != nil {
            while curr != nil {
                if curr!.left != nil {
                    prev?.next = curr!.left
                    prev = curr!.left
                    if nextHead == nil {
                        nextHead = curr!.left
                    }
                }
                if curr!.right != nil {
                    prev?.next = curr!.right
                    prev = curr!.right
                    if nextHead == nil {
                        nextHead = curr!.right
                    }
                }
                curr = curr!.next
            }
            curr = nextHead
            nextHead = nil
            prev = nil
        }
        
        return root
    }