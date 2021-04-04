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