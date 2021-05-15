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

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        guard let node = root else {return "x"}
        let left = serialize(node.left)
        let right = serialize(node.right)
        return String(node.val) + "," + left + "," + right + ","
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var arr = data.split(separator: ",")
        func dfs() -> TreeNode? {
            guard arr.first != nil else {return nil}
            let s = arr.removeFirst()
            if s == "x" {return nil}
            let node = TreeNode(Int(s)!)
            node.left = dfs()
            node.right = dfs()
            return node
        }
        return dfs()
    }
}

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        guard let node = root else {return "x"}
        let left = serialize(node.left)
        let right = serialize(node.right)
        return "\(node.val)," + left + "," + right + ","
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var arr = data.split(separator: ",")
        var index = 0
        func dfs() -> TreeNode? {
            if arr[index] == "x" {
                index += 1
                return nil
            }
            let node = TreeNode(Int(arr[index])!)
            index += 1
            node.left = dfs()
            node.right = dfs()
            return node
        }
        return dfs()
    }
}