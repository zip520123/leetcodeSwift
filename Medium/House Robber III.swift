//House Robber III
//basic intuition 
class Solution {
    func rob(_ root: TreeNode?) -> Int {
        guard let node = root else {return 0}
        
        let leftSub = rob(node.left?.left) + rob(node.left?.right)
        let rightSub = rob(node.right?.left) + rob(node.right?.right)
        
        return max(node.val + leftSub + rightSub, rob(node.left) + rob(node.right))
    }
}
//hashable map
class Solution {
    var dict = [TreeNode: Int]()
    func rob(_ root: TreeNode?) -> Int {
        guard let node = root else {return 0}
        if dict[node] != nil {
            return dict[node]!
        }
        let leftSub = rob(node.left?.left) + rob(node.left?.right)
        let rightSub = rob(node.right?.left) + rob(node.right?.right)
        
        let res = max(node.val + leftSub + rightSub, rob(node.left) + rob(node.right))
        dict[node] = res
        return res
        
    }
}
extension TreeNode: Hashable {
    public static func ==(_ left: TreeNode, _ right: TreeNode) -> Bool {
        return left === right
    }
    public var hashValue: Int {
        return ObjectIdentifier(self).hashValue
    }
}

extension TreeNode: Hashable {
    public static func ==(_ left: TreeNode, _ right: TreeNode) -> Bool {
        return left === right
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self).hashValue)
    }
}

//carry previous data
func rob(_ root: TreeNode?) -> Int {
    func dfs(_ node: TreeNode?) -> (now: Int, last: Int) {
        guard let node = node else {return (0,0)}
        let (lnow, llast) = dfs(node.left)
        let (rnow, rlast) = dfs(node.right)
        return (max(lnow + rnow, llast + rlast + node.val), lnow + rnow )
    }
    return dfs(root).now
}

//carry previous data 2
class Solution {
    struct Money {
        let now: Int
        let last: Int
    }
    
    func rob(_ root: TreeNode?) -> Int {
        return dfs(root).now
    }
    
    func dfs(_ node: TreeNode?) -> Money {
        guard let node = node else {return Money(now:0,last:0)}
        let leftMoney = dfs(node.left)
        let rightMoney = dfs(node.right)
        let now = max(node.val+leftMoney.last+rightMoney.last,leftMoney.now + rightMoney.now)
        return Money(now:now, last: leftMoney.now + rightMoney.now)
    }
}
