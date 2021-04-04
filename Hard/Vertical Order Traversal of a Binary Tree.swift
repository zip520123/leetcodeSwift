//Vertical Order Traversal of a Binary Tree
//bfs
class Point {
    let node: TreeNode
    let x, y: Int
    init(_ node: TreeNode, _ x: Int, _ y: Int) {
        self.node = node
        self.x = x
        self.y = y
    }
}
class Solution {
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        if root == nil { return [] }
        
        var result = [[Int]]()
        var xToNodes = [Int : [(y: Int, val: Int)]]()
        var queue = [Point]()
        var index = 0
        queue.append(Point(root!, 0, 0))
        
        // traverse tree and add to xToNodes
        while index < queue.count {
            let point = queue[index]
            let node = point.node
            let x = point.x
            let y = point.y
            
            xToNodes[x, default: []].append((y: y, val: node.val))
            if let left = node.left { queue.append(Point(left, x - 1, y + 1))}
            if let right = node.right { queue.append(Point(right, x + 1, y + 1))}
            
            index += 1
        }
        
        // iterate over sorted Xs
        for x in xToNodes.keys.sorted() {
            let sortedYVals = xToNodes[x]!.sorted { $0.y == $1.y ? $0.val < $1.val : $0.y < $1.y }
            let sortedVals = sortedYVals.map { $0.val }
            
            // add nodes to the same-x group in sorted-y order
            var xGroup = [Int]()
            for val in sortedVals {
                xGroup.append(val)
            }
            
            result.append(xGroup)
        }
        
        return result
    }
}

//dfs
struct Point: Hashable, Comparable {
    var y: Int
    var val: Int
    
    static func < (lhs: Point, rhs: Point) -> Bool {
        if lhs.y == rhs.y {
            return lhs.val < rhs.val
        }
        return lhs.y < rhs.y
    }
}
final class Solution {
    var locationValues = [Int: [Point]]()
    
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        dfs(0, 0, root)
        let keys = locationValues.keys.sorted()
        var values = [[Int]]()
        for key in keys {
            values.append(locationValues[key]!.sorted().map { $0.val })
        }
        return values
    }
    
    func dfs(_ x: Int, _ y: Int,_ node: TreeNode?) {
        if node == nil {
            return
        }
        locationValues[x, default: []].append(Point(y: y, val: node!.val))
        if node!.left != nil {
            dfs(x - 1, y + 1, node!.left)
        }
        if node!.right != nil {
            dfs(x + 1, y + 1, node!.right)
        }
    }
}