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

class Solution {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        return bst(1,n)
    }
    
    func bst(_ l: Int, _ r: Int) -> [TreeNode?] {
        if l > r {return [nil]}
        var res = [TreeNode?]()
        for i in l...r {
            let left = bst(l, i-1)
            let right = bst(i+1,r)
            for leftNode in left {
                for rightNode in right {
                    let root = TreeNode(i)
                    root.left = leftNode
                    root.right = rightNode
                    res.append(root)
                }
            }
        }
        return res
    }
}