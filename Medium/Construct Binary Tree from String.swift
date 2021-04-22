//Construct Binary Tree from String
//O(n) O(h)
func str2tree(_ s: String) -> TreeNode? {
    var index = 0
    if s == "" {return nil}
    let sArr = Array(s)

    func dfs() -> TreeNode? {
        var isNegtive = false
        if sArr[index] == "-" {
            isNegtive = true
            index += 1
        }
        var n = 0
        while index < sArr.endIndex, let num = Int(String(sArr[index])) {
            n = n * 10 + num
            index += 1
        }
        if isNegtive {
            n = -n
        }
        let node = TreeNode(n)
        if index < sArr.endIndex && sArr[index] == "(" {
            index += 1
            node.left = dfs()
        }
        if index < sArr.endIndex && sArr[index] == "(" {
            index += 1
            node.right = dfs()
        }
        
        index += 1
        return node
    }
    
    return dfs()
}