//Boundary of Binary Tree
//O(n)
class Solution {
    var rightB = [Int]()
    var leftB = [Int]()
    var leaves = [Int]()
    func boundaryOfBinaryTree(_ root: TreeNode?) -> [Int] {
        guard let node = root else {return []}
        
        if isLeaf(node) {return [node.val]}
        var top = [node.val]
        if node.left != nil {findLeft(node.left!)}
        if node.right != nil {findRight(node.right!)}
        findLeaves(node)
        return top + leftB + leaves + rightB
    }
    
    func findLeaves(_ node: TreeNode?) {
        guard let node = node else {return}
        if isLeaf(node) {
            leaves.append(node.val)
            return
        }
        findLeaves(node.left)
        findLeaves(node.right)
    }
    
    func findRight(_ node: TreeNode) {
        if isLeaf(node) {return}
        rightB.insert(node.val, at:0)
        var child: TreeNode!
        if node.left != nil {child = node.left!}
        if node.right != nil {child = node.right!}
        findRight(child)
    } 
    
    func findLeft(_ node: TreeNode) {
        if isLeaf(node) {return}
        leftB.append(node.val)
        var child: TreeNode!
        if node.right != nil {child = node.right!}
        if node.left != nil {child = node.left!}
        findLeft(child)
    }
    
    
    func isLeaf(_ node: TreeNode) -> Bool {
        return node.left == nil && node.right == nil
    }
    
}
//O(n)
class Solution {
    var res = [Int]()
    func boundaryOfBinaryTree(_ root: TreeNode?) -> [Int] {
        guard let root = root else {return []}
        if isLeaf(root) {return [root.val]}
        res.append(root.val)
        if root.left != nil {findLeft(root.left!)}
        findLeaves(root)
        if root.right != nil {findRight(root.right!)}
        return res
    }
    func findRight(_ node: TreeNode) {
        if isLeaf(node) {return}
        var child: TreeNode!
        if node.left != nil {child = node.left}
        if node.right != nil {child = node.right}
        findRight(child)
        res.append(node.val)
    }
    func findLeft(_ node: TreeNode) {
        if isLeaf(node) {return}
        res.append(node.val)
        var child: TreeNode!
        if node.right != nil {child = node.right}
        if node.left != nil {child = node.left}
        findLeft(child)
    }
    
    func findLeaves(_ node: TreeNode) {
        if isLeaf(node) {
            res.append(node.val)
        }
        if node.left != nil {findLeaves(node.left!)}
        if node.right != nil {findLeaves(node.right!)}
    }
    
    func isLeaf(_ node: TreeNode) -> Bool {
        return node.left == nil && node.right == nil
    }
}