/*Construct Binary Tree from Preorder and Inorder Traversal*/
//O(preorder.len * inorder.len), O(tree height)
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var preIndex = 0
        
        func dfs(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right {return nil}
            let p = preorder[preIndex]
            let node = TreeNode(p)
            preIndex += 1
            var inIndex: Int?
            for i in left...right {
                if inorder[i] == p {
                    inIndex = i
                }
            }
            
            node.left = dfs(left, inIndex!-1)
            node.right = dfs(inIndex!+1, right)
            return node
        }
        
        return dfs(0, preorder.endIndex-1)
    }

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var preIndex = 0
        var dict = [Int:Int]()
        for (i,n) in inorder.enumerated() {
            dict[n] = i
        }
        
        func dfs(_ start:Int, _ end: Int) -> TreeNode? {
            if start > end {return nil}
            let node = TreeNode(preorder[preIndex])
            preIndex += 1
            let inIndex = dict[node.val]!
            node.left = dfs(start,inIndex - 1)
            node.right = dfs(inIndex+1, end)
            return node
        }
        
        return dfs(0,inorder.endIndex - 1)
    }

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var index = 0    
        var dict = [Int:Int]()
        for (i,n) in inorder.enumerated() {
            dict[n] = i
        }
        func dfs(_ l: Int, _ r: Int) -> TreeNode? {
            if l > r {return nil}
            let val = preorder[index]
            let node = TreeNode(val)
            index += 1
            let inindex = dict[val]!
            
            node.left = dfs(l,inindex-1)
            node.right = dfs(inindex+1,r)
            return node
        }
        
        return dfs(0,preorder.endIndex-1)
    }

//O(preorder.len + inorder.len), O(tree height)
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var preIndex = 0
        var dict = [Int: Int]()
        for (i, n) in inorder.enumerated() {
            dict[n] = i
        }
        
        func dfs(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right {return nil}
            let p = preorder[preIndex]
            let node = TreeNode(p)
            preIndex += 1
            var inIndex = dict[p]
            
            node.left = dfs(left, inIndex!-1)
            node.right = dfs(inIndex!+1, right)
            return node
        }
        
        return dfs(0, preorder.endIndex-1)
    }