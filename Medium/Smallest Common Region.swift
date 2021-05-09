//Smallest Common Region
//O(n) O(n), n = treeNode.len
class Solution {
    class Node {
        let val: String
        var children = [Node]()
        init(_ val: String) {
            self.val = val
        }
    }
    func findSmallestRegion(_ regions: [[String]], _ region1: String, _ region2: String) -> String {
        var dict = [String: Node]()
        for region in regions {
            let name = region[0]
            if dict[name] == nil {
                dict[name] = Node(name)
            }
            let node = dict[name]!
            
            for child in region[1...] {
                if dict[child] == nil {
                    dict[child] = Node(child)
                }
                node.children.append(dict[child]!)
            }
            
        }
        let root = dict[regions[0][0]]!
        
        func findLowAncestor(_ node: Node?) -> Node? {
            guard let node = node else {return nil}
            if node.val == region1 || node.val == region2 {return node}
            let children = node.children.compactMap{ findLowAncestor($0) }
            if children.count == 2 {return node}
            if children.count == 1 {return children[0]}
            return nil
        }
        
        return findLowAncestor(root)?.val ?? ""
    }
}
/*

regions = [
["Earth","North America","South America"],
["North America","United States","Canada"],
["United States","New York","Boston"],
["Canada","Ontario","Quebec"],
["South America","Brazil"]],
region1 = "Quebec",
region2 = "New York"
Output: "North America"


["Earth","North America","South America"],
                  Earth
               /         \
    "North America","South America"
    /           \                   \
"United States",    "Canada"        "Brazil"
    /       \         /     \
"New York","Boston" "Ontario","Quebec"

*/