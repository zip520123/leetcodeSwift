/*Serialize and Deserialize Binary Tree*/
func serialize(_ root: TreeNode?) -> String {
    if root == nil {return "X,"}
    let left = serialize(root!.left)
    let right = serialize(root!.right)
    return String(root!.val) + "," + left + right 
}

func deserialize(_ data: String) -> TreeNode? {
    var arr = data.split(separator: ",").map {String($0)}
    func dfs() -> TreeNode? {
        guard let nodeS = arr.first else {return nil}
        arr.removeFirst()
        if nodeS == "X" {return nil} 
        let node = TreeNode(Int(nodeS)!)
        node.left = dfs()
        node.right = dfs()
        return node
    }
    return dfs()
}

//time O(n) space O(n)
func serialize(_ root: TreeNode?) -> String {
    guard let node = root else {return "X"}
    var arr = [String]()
    func dfs(_ node: TreeNode?) {
        guard let node = node else {
            arr.append("X")
            return
        }
        arr.append(String(node.val))
        dfs(node.left)
        dfs(node.right)
    }
    dfs(root)
    return arr.joined(separator: ",")
}

func deserialize(_ data: String) -> TreeNode? {
    var arr = data.split(separator: ",").map{ String($0) }
    
    func dfs() -> TreeNode? {
        guard let nodeS = arr.first else {return nil}
        arr.removeFirst()
        if nodeS == "X" {return nil}
        guard let val = Int(nodeS) else {return nil}
        let node = TreeNode(val)
        node.left = dfs()
        node.right = dfs()
        return node
    }
    
    return dfs()
}