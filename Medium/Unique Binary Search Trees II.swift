//Unique Binary Search Trees II (DFS)
//O(n!) O(n!)
class Solution {
    
    func generateTrees(_ n: Int) -> [TreeNode?] {
        return generateSubTrees(1,n)
    }
    
    func generateSubTrees(_ start: Int,_ end: Int) -> [TreeNode?] {
        if start > end {return [nil]}
        if start == end {return [TreeNode(start)]}
        var res = [TreeNode?]()
        
        for i in start...end {
            let left = generateSubTrees(start, i-1)
            let right = generateSubTrees(i+1,end)
            for leftNode in left {
                for rightNode in right {
                    let node = TreeNode(i)
                    node.left = leftNode
                    node.right = rightNode
                    res.append(node)
                }
            }
        }
        return res
    } 
}