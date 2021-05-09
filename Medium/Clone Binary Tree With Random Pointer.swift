//Clone Binary Tree With Random Pointer
//O(n), O(n), n = treeNode.len
class Solution {
    func copyRandomBinaryTree(_ root: Node?) -> NodeCopy? {
        guard let root = root else {return nil}
        var nodeToClone = [Node:NodeCopy]()
        
        func dfs(_ node: Node?) {
            guard let node = node else {return}
            if nodeToClone[node] == nil {
                nodeToClone[node] = NodeCopy(node.val)
            }
            dfs(node.left)
            dfs(node.right)
        }
        dfs(root)
        
        func connect(_ node: Node?) {
            guard let node = node else {return}
            let cloneNode = nodeToClone[node]
            if let left = node.left {cloneNode?.left = nodeToClone[left] }
            if let right = node.right {cloneNode?.right = nodeToClone[right] }
            if let random = node.random {cloneNode?.random = nodeToClone[random] }
            connect(node.left)
            connect(node.right)
        }
        connect(root)
        return nodeToClone[root]
    }
}
//one pass, O(n), O(n), n = treeNode.len
class Solution {
    var dict = [Node: NodeCopy]()
    func copyRandomBinaryTree(_ root: Node?) -> NodeCopy? {
        guard let node = root else {return nil}
        if let copyNode = dict[node] {
            return copyNode
        }
        let copyNode = NodeCopy(node.val)
        dict[node] = copyNode
        copyNode.left = copyRandomBinaryTree(node.left)
        copyNode.right = copyRandomBinaryTree(node.right)
        copyNode.random = copyRandomBinaryTree(node.random)
        return copyNode
    }
}