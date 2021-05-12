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

class Solution {
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        guard let root = root else {return []}
        var graph = [TreeNode:TreeNode]()
        var queue = [(TreeNode, TreeNode)]()
        if root.left != nil {
            queue.append((root, root.left!))
        }
        if root.right != nil {
            queue.append((root, root.right!))
        }
        while queue.isEmpty == false {
            let (parent, node) = queue.removeFirst()
            graph[node] = parent
            if node.left != nil {
                queue.append((node, node.left!))
            }
            if node.right != nil {
                queue.append((node, node.right!))
            }
        }
        var seen = Set<TreeNode>()
        var level = k
        var nodeQueue = [target!]
        var tempQueue = [TreeNode]()
        seen.insert(target!)
        while level >= 0 {
            level -= 1
            tempQueue = nodeQueue
            nodeQueue.removeAll()
            for node in tempQueue {
                if node.left != nil && seen.contains(node.left!) == false {
                    seen.insert(node.left!)
                    nodeQueue.append(node.left!)
                }
                if node.right != nil && seen.contains(node.right!) == false {
                    seen.insert(node.right!)
                    nodeQueue.append(node.right!)
                }
                if let parent = graph[node], seen.contains(parent) == false {
                    seen.insert(parent)
                    nodeQueue.append(parent)
                }
                
            }
        }
        return tempQueue.map { $0.val }
    }
}