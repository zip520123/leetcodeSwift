//All Possible Full Binary Trees
//O(n) O(n)
class Solution {
    var map = [Int:[TreeNode]]()
    func allPossibleFBT(_ n: Int) -> [TreeNode?] {
        if n == 0 || n % 2 == 0 {return []}
        if n == 1 {return [TreeNode()]}
        if let trees = map[n] {
            return trees
        }

        var res = [TreeNode]()
        var i = 1
        while i < n {
            let leftSubTrees = allPossibleFBT(i)
            let rightSubTrees = allPossibleFBT(n-i-1)
            for l in leftSubTrees {
                for r in rightSubTrees {
                    let root = TreeNode()
                    root.left = l
                    root.right = r
                    res.append(root)
                }
            }
            i+=1
        }
        map[n] = res
        return res
    }
    
}

class Solution {
    func allPossibleFBT(_ n: Int) -> [TreeNode?] {
        if n % 2 == 0 {return []}
        if n == 1 {return [TreeNode()]}
        var res = [TreeNode?]()
        for i in 1..<n {
            let left = allPossibleFBT(i)
            let right = allPossibleFBT(n-i-1)
            for leftTree in left {
                for rightTree in right {
                    let root = TreeNode()
                    root.left = leftTree
                    root.right = rightTree
                    res.append(root)
                }
            }
        }
        return res
    }
}