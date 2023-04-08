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

//O(n), O(n)
class Solution {
    var dict = [Int: Node]()
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else {return nil}
        if let existNode = dict[node.val] {
            return existNode
        }
        let newNode = Node(node.val)
        dict[node.val] = newNode
        newNode.neighbors = node.neighbors.map {cloneGraph($0)}
        return newNode
    }
}

class Solution {
    var dict = [Int: Node]()
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else {return nil}
        if dict[node.val] == nil {
            let newNode = Node(node.val)
            dict[node.val] = newNode
            for nei in node.neighbors {
                newNode.neighbors.append(cloneGraph(nei)) 
            }
        }
        return dict[node.val]
    }
}