// Clone N-ary Tree
//O(n), O(n), n = treeNode.len
class Solution {
    var dict = [Node: Node]()
    func cloneTree(_ root: Node?) -> Node? {
        guard let node = root else {return nil}
        if let cloneNode = dict[node] {
            return cloneNode
        }
        let cloneNode = Node(node.val)
        dict[node] = cloneNode
        cloneNode.children = node.children.compactMap { cloneTree($0) }
        return cloneNode
    }
}
//O(n), O(1), n = treeNode.len
class Solution {
    func cloneTree(_ root: Node?) -> Node? {
        guard let node = root else {return nil}
        let cloneNode = Node(node.val)
        
        cloneNode.children = node.children.compactMap { cloneTree($0) }
        return cloneNode
    }
}