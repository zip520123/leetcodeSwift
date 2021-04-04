//Flatten Binary Tree to Linked List
//O(n) O(tree hieght)
    func flatten(_ root: TreeNode?) {
        var arr = [TreeNode]()
        
        func dfs(_ node: TreeNode?) {
            if node == nil {return }
            arr.append(node!)
            dfs(node!.left)
            dfs(node!.right)
        }
        
        dfs(root)
        arr.reduce(TreeNode(),{prev, curr in
            prev.right = curr
            prev.left = nil
            return curr
        })
    }

    //O(n) space O(1) or O(tree hieght)
    //postorderTraversal and reversed link the nodes
    class Solution {    
    var prev : TreeNode?
    func flatten(_ root: TreeNode?) {
        if root == nil {return }
        flatten(root!.right)
        flatten(root!.left)
        root!.right = prev
        root!.left = nil
        prev = root
        
    }
}

//O(n) O(1)
    func flatten(_ root: TreeNode?) {
        var curr = root
        while curr != nil {
            if curr!.left != nil {
                var last = curr!.left!
                while last.right != nil {
                    last = last.right!
                }
                last.right = curr!.right
                curr!.right = curr!.left
                curr!.left = nil
            }
            curr = curr!.right
        }
    }
