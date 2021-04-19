//All Nodes Distance K in Binary Tree
//O(n) O(n)
class Solution {
    typealias Node = TreeNode
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        if target == nil {return []}
        var dict = [Node: Node]()

        func dfs(_ node: Node?, _ parent: Node?) {
            guard let node = node else {return}
            if parent != nil { dict[node] = parent }
            dfs(node.left, node)
            dfs(node.right, node)
        }
        dfs(root, nil)
        
        var seen = Set<Node>()
        seen.insert(target!)
        var queue = [target!]
        var dist = 0
        while queue.isEmpty == false {
            let temp = queue
            queue.removeAll()
            
            if dist == k {
                return temp.map {$0.val}
            }
            for node in temp {
                if node.left != nil && seen.contains(node.left!) == false {
                    seen.insert(node.left!)
                    queue.append(node.left!)
                } 
                if node.right != nil && seen.contains(node.right!) == false {
                    seen.insert(node.right!)
                    queue.append(node.right!)
                }
                if let parent = dict[node] {
                    if seen.contains(parent) == false {
                        seen.insert(parent)
                        queue.append(parent)
                    }
                }
            }
            dist += 1
        }
        return []
    }
}
extension TreeNode: Hashable {
    public static func ==(l: TreeNode, r: TreeNode) -> Bool{
        l === r
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self).hashValue)
    }
}
