//Serialize and Deserialize BST
class Codec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        guard let node = root else {return "x"}
        let left = serialize(node.left)
        let right = serialize(node.right)
        return String(node.val) + "," + left + "," + right + ","
    }
    
    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        var arr = data.split(separator:",")
        func dfs() -> TreeNode? {
            guard let s = arr.first else {return nil}
            arr.removeFirst()
            if s == "x" {return nil}
            let node = TreeNode(Int(s)!)
            node.left = dfs()
            node.right = dfs()
            return node
        }
        return dfs()
    }
}
