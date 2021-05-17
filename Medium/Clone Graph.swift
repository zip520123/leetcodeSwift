/*Clone Graph*/
//time O(n) space O(n)
var dict: Dictionary<Int,Node> = [:]
func cloneGraph(_ node: Node?) -> Node? {
    guard let node = node else {return nil}
    var newNode = dict[node.val]
    if newNode == nil {
        newNode = Node(node.val)
        dict[node.val] = newNode
        newNode!.neighbors = node.neighbors.map { cloneGraph($0) }
    }
    return newNode
}

    var dict = [Node: Node]()
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else {return nil}
        if dict[node] == nil {
            let cloneNode = Node(node.val)
            dict[node] = cloneNode
            cloneNode.neighbors = node.neighbors.map{cloneGraph($0)}
        }
        return dict[node]!
    }