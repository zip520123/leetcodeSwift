//Find Mode in Binary Search Tree
    func findMode(_ root: TreeNode?) -> [Int] {
        var dict = [Int: Int](), res = [Int]()
        func dfs(_ node: TreeNode?) {
            guard let node = node else {return }
            dict[node.val, default:0] += 1
            dfs(node.left)
            dfs(node.right)
        }
        dfs(root)
        
        var count = 0
        for (key, value) in dict {
            if value > count {
                count = value
                res.removeAll()
                res.append(key)
            } else if value == count {
                res.append(key)
            }
        }
        return res
    }
//O(n) O(1)
    func findMode(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        var prev: Int?, count = 0, maxCount = -1
        func dfs(_ node: TreeNode?) {
            guard let node = node else {return}
            dfs(node.left)
            if prev == node.val {
                count += 1
            } else {
                count = 1
            }
            prev = node.val
            if count == maxCount {
                res.append(node.val)
            } else if count > maxCount {
                res.removeAll()
                res.append(node.val)
                maxCount = count
            }
            dfs(node.right)
        }
        dfs(root)
        return res
    }