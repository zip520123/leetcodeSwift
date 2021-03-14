/*Subtree of Another Tree*/
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    //not work with duplicate node value
    func dfs(_ node: TreeNode?) -> TreeNode? {
        guard let node = node, let t = t else {return nil}
        let left = dfs(node.left) 
        let right = dfs(node.right)
        if left != nil {
            return left
        }
        if right != nil {
            return right
        }
        if node.val == t.val {
            return node
        }
        return nil
    } 
    
    if let startNode = dfs(s) {
        func dfs(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
            if node1 == nil && node2 == nil {return true}
            let left = dfs(node1!.left, node2!.left)    
            let right = dfs(node1!.right, node2!.right)    
            
            let curr = node1!.val == node2!.val
            return left && right && curr
        }
        
        return dfs(startNode, t)
    } else {
        return false
    }
    
            
}
//O(m * n) space O(n)
func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    
    func travers(_ node1: TreeNode?,_ node2: TreeNode?) -> Bool {
        return node1 != nil && (isEquals(node1, node2) || travers(node1!.left, node2) || travers(node1!.right, node2))
    }
    
    func isEquals(_ x: TreeNode?, _ y: TreeNode?) -> Bool {
        if x == nil && y == nil {return true}
        if x == nil || y == nil {return false}
        return x!.val == y!.val && isEquals(x!.left,y!.left) && isEquals(x!.right, y!.right)
    }
    
    return travers(s,t)
}

func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    func dfs(_ s:TreeNode?) -> Bool {
        return s != nil && (isEqual(s,t) || dfs(s!.left) || dfs(s!.right))
    }
    
    func isEqual(_ t1: TreeNode?, _ t2: TreeNode?) -> Bool {
        if t1 == nil && t2 == nil {return true}
        if t1 == nil || t2 == nil {return false}
        
        return t1!.val == t2!.val && isEqual(t1!.left, t2!.left) && isEqual(t1!.right, t2!.right)
    }
    
    return dfs(s)
}