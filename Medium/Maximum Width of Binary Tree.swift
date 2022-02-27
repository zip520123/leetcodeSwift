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