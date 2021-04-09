//Recover a Tree From Preorder Traversal
    func recoverFromPreorder(_ S: String) -> TreeNode? {
        var stack = [TreeNode]()
        var i = 0 
        let sArr = Array(S)
        while i < sArr.endIndex {
            var level = 0
            while i < sArr.endIndex && sArr[i] == "-" {
                level += 1; i+=1
            }
            var val = 0
            while i < sArr.endIndex && sArr[i] != "-" {
                val = val * 10 + Int(String(sArr[i]))!
                i+=1
            }
            while stack.endIndex > level {
                stack.removeLast()
            }
            let node = TreeNode(val)
            if let lastNode = stack.last {
                if lastNode.left == nil {
                    lastNode.left = node
                } else {
                    lastNode.right = node
                }
            }
            
            stack.append(node)
            
        }
        while stack.endIndex > 1 {
            stack.removeLast()
        }
        return stack.last!
    }