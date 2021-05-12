//Lowest Common Ancestor of a Binary Tree III
//O(n) O(h)
    func lowestCommonAncestor(_ p: Node?,_ q: Node?) -> Node? {
        var dict = [Int:Node]()
        var curr = p
        while curr != nil {
            dict[curr!.val] = curr
            curr = curr!.parent
        }
        
        curr = q
        while curr != nil {
            if dict[curr!.val] != nil {
                return dict[curr!.val]
            }
            curr = curr!.parent
        }
        
        return nil
    }
//O(n) O(h)
    func lowestCommonAncestor(_ p: Node?,_ q: Node?) -> Node? {
        if p == nil {return nil}
        var root = p!
        while root.parent != nil {
            root = root.parent!
        }
        return lca(root, p!, q!)
    }
    
    func lca(_ root:Node?, _ p: Node, _ q: Node) -> Node? {
        guard let node = root else {return nil}
        if node.val == p.val || node.val == q.val {return node}
        let left = lca(node.left,p,q)
        let right = lca(node.right,p,q)
        if left != nil && right != nil {return node}
        if left == nil {return right}
        return left
    }

//O(n) O(h)
class Solution {
    func lowestCommonAncestor(_ p: Node?,_ q: Node?) -> Node? {
        var root = p
        while root!.parent != nil {
            root = root!.parent
        }
        
        func dfs(_ node: Node?) -> Node? {
            guard let node = node else {return nil}
            if node === p || node === q {return node}
            let left = dfs(node.left), right = dfs(node.right)
            if left != nil && right != nil {return node}
            if left != nil {return left}
            return right
            
        }
        
        return dfs(root)
    }
}