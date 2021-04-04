//Construct Binary Tree from Inorder and Postorder Traversalclass Solution {
    // O(n) O(h)
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var postIndex = postorder.endIndex - 1
        var dict = [Int:Int]()
        for (i,n) in inorder.enumerated() {
            dict[n] = i
        }
        
        func dfs(_ left: Int,_ right:Int) -> TreeNode? {
            if left > right {return nil}
            let node = TreeNode(postorder[postIndex])
            postIndex -= 1
            if left == right {return node}
            let inIndex = dict[node.val]!
            node.right = dfs(inIndex+1,right)
            node.left = dfs(left,inIndex-1)
            return node
        }
        
        return dfs(0,inorder.endIndex - 1)
    }