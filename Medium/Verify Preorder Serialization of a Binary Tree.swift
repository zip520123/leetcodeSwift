//Verify Preorder Serialization of a Binary Tree
//O(n), O(n)
    func isValidSerialization(_ preorder: String) -> Bool {
        var isRoot = true
        var stack = [(Character, Character, Character)]()
        let sArr = preorder.split(separator: ",")
        for i in 0..<sArr.endIndex {
             if let n = Int(String(sArr[i])) {
                if stack.isEmpty && isRoot == false {return false}
                if isRoot {
                    isRoot = false
                } else {
                    let (node,left, right) = stack.removeLast()
                    if left == "x" {
                        stack.append((node, "1", "x"))
                    }
                } 
                stack.append(("1","x","x"))
            } else {
                if stack.isEmpty {
                    if isRoot {
                         isRoot = false
                        continue
                     } else {
                        return false
                     }
                }
                 let (node,left,right) = stack.removeLast()
                if left == "x" {
                    stack.append((node, "#", "x"))
                } 
            }
        }
        return stack.isEmpty
    }
//O(n), O(1)
    func isValidSerialization(_ preorder: String) -> Bool {
        let sArr = preorder.split(separator: ",")
        var slot = 1
        for char in sArr {
            if slot == 0 {return false}
            if char == "#" {
                slot -= 1
            } else {
                slot += 1
            }
        }
        return slot == 0
    }