//Path Sum III
//O(n) O(n)

//sum[i,j] = sum[0,j] - sum[0,i]
//sum[0,i] = sum[0,j] - sum[i,j]
    func pathSum(_ root: TreeNode?, _ target: Int) -> Int { 
        var res = 0
        var dict = [0:1]
        func dfs(_ node: TreeNode?, _ curr: Int) {
            guard let node = node else {return}
            let currSum = curr + node.val
            if dict[currSum - target] != nil {
                res += dict[currSum - target]!
            }
            dict[currSum, default:0] += 1
            dfs(node.left,currSum)
            dfs(node.right,currSum)
            dict[currSum, default:0] -= 1
        }
        dfs(root,0)
        return res
    }
