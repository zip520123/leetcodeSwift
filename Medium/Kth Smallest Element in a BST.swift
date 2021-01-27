/*Kth Smallest Element in a BST*/
//time O(n) space O(log n, height of the tree)
//iterative
func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    var stack = [TreeNode]()
    var root = root
    var k = k
    while true {
        while root != nil {
            stack.append(root!)
            root = root!.left
        }
        root = stack.removeLast()
        k -= 1
        if k == 0 {
            return root!.val
        }
        root = root!.right
    }
    return 0
}
//time O(n) space O(n)
//recursive
func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    var arr = [Int]()
    func dfs(_ curr: TreeNode?) {
        if curr == nil {return}
        dfs(curr!.left)
        arr.append(curr!.val)
        dfs(curr!.right)
    }
    dfs(root)
    return arr[k-1]
}

//time O(n) space O(k)
func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    var count = 0
    var res = 0
    func dfs(_ root: TreeNode?) {
        if root == nil {return}
        dfs(root!.left)
        count += 1
        if count == k {
            res = root!.val
            return 
        }
        dfs(root!.right)
    }
    dfs(root)
    return res
}