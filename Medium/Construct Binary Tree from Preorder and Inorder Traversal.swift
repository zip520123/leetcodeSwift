/*Construct Binary Tree from Preorder and Inorder Traversal*/
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    let pcount = preorder.count
    func dfs(_ index: Int, _ left: Int,_ right: Int) -> TreeNode?{
        if left > right || index >= pcount {
            return nil
        } 
        let curr = TreeNode(preorder[index])
        var inIndex = 0
        
        for i in left...right {
            if inorder[i] == preorder[index] {
                inIndex = i
                break
            }
        }
        curr.left = dfs(index+1, left, inIndex - 1)
        curr.right = dfs(index+1 + inIndex - left, inIndex + 1, right)
        return curr
    }
    
    return dfs(0, 0, pcount - 1)
}

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    
    func dfs(_ start: Int, _ end: Int, _ index: Int) -> TreeNode? {
        if start > end || index >= preorder.endIndex {return nil}
        let value = preorder[index]
        let tree = TreeNode(value) 
        var inIndex = 0
        for i in start...end {
            if inorder[i] == value {
                inIndex = i
                break
            }
        }
        
        tree.left = dfs(start, inIndex - 1, index + 1)
        tree.right = dfs(inIndex + 1, end,  index + 1 + inIndex - start)
        return tree
    }
    
    return dfs(0, preorder.endIndex - 1, 0)
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