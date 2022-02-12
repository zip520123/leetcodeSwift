//All Elements in Two Binary Search Trees
//O(root1 + root2)
class Solution {
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var list1 = [Int]()
        var list2 = [Int]()
        
        
        func traverse(_ node: TreeNode?, _ list: inout [Int]) {
            var curr = node
            var stack = [TreeNode]()
            while !stack.isEmpty || curr != nil {
                while curr != nil {
                    stack.append(curr!)
                    curr = curr!.left
                }
                curr = stack.removeLast()
                list.append(curr!.val)
                curr = curr!.right
            }
        }
        
        
        traverse(root1, &list1)
        traverse(root2, &list2)
        
        var res = [Int]()
        var l = 0, r = 0
        while l < list1.endIndex && r < list2.endIndex {
            if list1[l] < list2[r] {
                res.append(list1[l])
                l += 1
            } else {
                res.append(list2[r])
                r += 1
            }
        }
        
        while l < list1.endIndex {
            res.append(list1[l])
            l += 1
        }
        while r < list2.endIndex {
            res.append(list2[r])
            r += 1
        }
        return res
    }
}

//O(n log n), O(h)
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var res = [Int]()
        func dfs(_ root: TreeNode?) {
            guard let node = root else {return}
            dfs(node.left)
            res.append(node.val)
            dfs(node.right)
        }
        dfs(root1)
        dfs(root2)
        return res.sorted()
    }