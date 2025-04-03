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

//O(n), O(n)
    func simplifyPath(_ path: String) -> String {
        var stack = [String]()
        var temp = ""
        for char in path {
            switch char {
                case "/":
                    switch temp {
                        case ".", "":
                            break
                        case "..":
                            if !stack.isEmpty {
                                stack.removeLast()    
                            }
                        default:
                            stack.append(temp)
                    }
                    temp = ""
                default:
                    temp += String(char)
            }
        }
        
        switch temp {
            case ".", "":
                break
            case "..":
                if !stack.isEmpty {
                    stack.removeLast()    
                }
            default:
                stack.append(temp)
        }
        
        var res = ""
        for str in stack {
            res += "/" + str
        }
        return res == "" ? "/" : res
    }

// O(n), O(n)
func simplifyPath(_ path: String) -> String {
    var arr = Array(path)
    var stack = [Character]()
    for char in arr {
        if !stack.isEmpty && stack.last! == "/" && char == "/" {
            stack.removeLast()
        }
        stack.append(char)
    }
    if !stack.isEmpty && stack.last! == "/" {
        stack.removeLast()
    }
    if !stack.isEmpty && stack.first! == "/" {
        stack.removeFirst()
    }
    var splited_arr = String(stack).split(separator: "/") 
    var file_stack = [String]()
    for file in splited_arr {
        if file == ".." {
            if !file_stack.isEmpty {
                file_stack.removeLast()
            }
        } else if file == "." {

        } else {
            file_stack.append(String(file))
        }
    }
    var res = ""
    for file in file_stack {
        res += "/" + file
    }
    if res == "" {
        return "/"
    }
    return res
}