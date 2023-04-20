//Maximum Width of Binary Tree
//O(n),O(n) MLE
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else {return 0}
        var queue: [TreeNode?] = [root]
        var res = 1
        while !queue.isEmpty {
            let temp = queue
            queue.removeAll()
            for optionNode in temp {
                if let node = optionNode {
                    queue.append(node.left)
                    queue.append(node.right)
                } else {
                    queue.append(nil)
                    queue.append(nil)
                }
            }
            var l = 0, r = 0
            for i in 0..<queue.endIndex {
                if queue[i] != nil {
                    l = i
                    break
                }
            }
            for i in (0..<queue.endIndex).reversed() {
                if queue[i] != nil {
                    r = i
                    break
                }
            }
            let isAllNil = queue.reduce(true) { $0 && $1==nil }
            if isAllNil { break }
            res = max(res, r-l+1)
            
        }
        return res
    }
    
//
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue: [(TreeNode, Int)] = []
        queue.append((root, 1))
        var maxLen = 1
        while !queue.isEmpty {
            let count = queue.count
            for _ in 0 ..< count {
                let curr = queue.removeFirst() 
                let index = curr.1
                if let left = curr.0.left {
                    queue.append((left, index &* 2))
                }

                if let right = curr.0.right {
                    queue.append((right, index &* 2 + 1))
                }
            }
            if !queue.isEmpty {
                maxLen = max(maxLen, queue.last!.1 &- queue.first!.1 &+ 1)                
            }
        }
        
        return maxLen
    }

//O(n),O(n) process exited with signal SIGILL
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        var res = 0
        guard let node = root else { return 0 }
        var queue: [(TreeNode, Int)] = [(node,0)]
        while !queue.isEmpty {
            let temp = queue
            queue.removeAll()
            for (subNode, col) in temp {
                if let left = subNode.left {
                    queue.append((left,col*2))
                }
                if let right = subNode.right {
                    queue.append((right,col*2+1))
                }
            }
            
            let firstIndex = temp.first!.1
            let lastIndex = temp.last!.1
            res = max(res, lastIndex-firstIndex+1 )
        }
        return res
    }