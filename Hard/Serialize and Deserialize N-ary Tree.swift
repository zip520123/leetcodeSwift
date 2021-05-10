//Serialize and Deserialize N-ary Tree
class Codec {
    func serialize(_ root: Node?) -> String {
    	guard let node = root else {return "[]"}
        var res = String(node.val)
        res += "[" + node.children.map { serialize($0) }.joined() + "]"
        return res
    }
    
    func deserialize(_ data: String) -> Node? {
        if data == "[]" {return nil}
        let sArr = Array(data)
        var val = 0
        var i = 0
        while let n = Int(String(sArr[i])) {
            val = val * 10 + n
            i += 1
        }
        var stack = ["["]
        var subNodesStart = i
        i += 1
        while stack.isEmpty == false {
            if sArr[i] == "[" {
                stack.append("[")
            } else if sArr[i] == "]" {
                stack.removeLast()
            }
            i += 1
        }
        var subNodesEnd = i
        let node = Node(val)
        if subNodesStart + 1 == subNodesEnd {
            return node
        }
        node.children = createNodes(String(sArr[subNodesStart+1..<subNodesEnd-1]))
    	return node
    }
    
    func createNodes(_ data: String) -> [Node] {
        var res = [Node]()
        var i = 0
        let sArr = Array(data)
        while i < sArr.endIndex {
            var val = 0 
            while let n = Int(String(sArr[i])) {
                val = val * 10 + n
                i += 1
            }
            let startIndex = i
            i += 1
            var stack = ["["]
            while !stack.isEmpty {
                if sArr[i] == "[" {
                    stack.append("[")
                } else if sArr[i] == "]"{
                    stack.removeLast()
                }
                i += 1
            }
            
            let endIndex = i
            let node = Node(val)
            if startIndex + 1 == endIndex {
                res.append(node)
            } else {
                node.children = createNodes(String(sArr[startIndex+1..<endIndex-1]))
                res.append(node)
            }
        }
        return res
    }
}
//Serialize and Deserialize
class Codec {
    func serialize(_ root: Node?) -> String {
    	guard let root = root else {return ""}
        var res = [String]()
        func dfs(_ node: Node) {
            res.append("\(node.val)")
            res.append("\(node.children.endIndex)")
            node.children.forEach { dfs($0) }
        }
        dfs(root)
        
        return res.joined(separator: ",")
    }
    
    func deserialize(_ data: String) -> Node? {
        if data == "" {return nil}
    	var sArr = data.split(separator: ",")
        var index = 0
        func dfs() -> Node {
            let val = Int(sArr[index])!
            index += 1
            let count = Int(sArr[index])!
            index += 1
            let node = Node(val)
            for i in 0..<count {
                node.children.append(dfs())
            }
            return node
        }
        return dfs()
    }
}

class Codec {
    func serialize(_ root: Node?) -> String {
    	guard let node = root else {return ""}
        var res = ""
        func dfs(_ node: Node) {
            res += String(node.val)
            res += ","
            res += String(node.children.endIndex)
            res += ","
            node.children.forEach {dfs($0)}
            
        }
        dfs(node)
        return res
    }
    
    func deserialize(_ data: String) -> Node? {
    	if data == "" {return nil}
        let list = data.split(separator: ",")
        var index = 0
        func dfs() -> Node? {
            let val = Int(list[index])!
            let node = Node(val)
            index += 1
            let count = Int(list[index])!
            index += 1
            node.children = (0..<count).compactMap{_ in dfs() }
            return node
        }
        return dfs()
    }
}