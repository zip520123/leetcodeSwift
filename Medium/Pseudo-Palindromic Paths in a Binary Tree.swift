/*Pseudo-Palindromic Paths in a Binary Tree*/
func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
    if root == nil {return 0}
    var res = 0
    func dfs(_ node: TreeNode, _ curr: [Int]) {
        var curr = curr
        curr[node.val]+=1
        if node.left == nil && node.right == nil {
            var hasOdd = false
            for n in curr {
                if n % 2 == 1 {
                    if hasOdd == true {
                        return 
                    } else {
                        hasOdd = true
                    }
                }
            }
            res += 1
            return 
        }   
        
        if let left = node.left {
            dfs(left, curr)
        }
        if let right = node.right {
            dfs(right,curr)
        }
        curr[node.val]-=1
    }
    
    dfs(root!,Array<Int>(repeating: 0, count: 10))
    
    
    return res
}