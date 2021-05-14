//Simplify Path
class Solution {
    func simplifyPath(_ path: String) -> String {
        var arr = Array(path)
        var stack = [String]()
        var i = 0
        var start = 0
        while i < arr.endIndex {
            if arr[i] == "/" {
                let curr = String(arr[start..<i])
                switch curr {
                    case "", ".":
                        break
                    case "..":
                        if stack.endIndex > 0 {
                            stack.removeLast()    
                        }
                    default:
                        stack.append(curr)
                }
                
                start = i + 1
            }
            i += 1
        }
        if start < i {
            let curr = String(arr[start..<i])
            switch curr {
                case "", ".":
                    break
                case "..":
                    if stack.endIndex > 0 {
                        stack.removeLast()    
                    }
                default:
                    stack.append(curr)
            }
        }
        
        return "/" + stack.joined(separator:"/")
    }
}

    func simplifyPath(_ path: String) -> String {
        var arr = path.split(separator: "/")
        var stack = [String]()
        for dir in arr {
            switch dir {
                case "", ".":
                    break
                case "..":
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                default:
                    stack.append(String(dir))
            }
        }
        return "/" + stack.joined(separator:"/")
    }