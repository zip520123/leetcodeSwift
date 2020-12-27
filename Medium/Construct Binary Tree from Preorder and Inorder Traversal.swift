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