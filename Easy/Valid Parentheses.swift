/*Valid Parentheses*/
//O(n), O(n)
func isValid(_ s: String) -> Bool {
    var arr = [Character]()
    
    for c in s {
        switch c {
            case "(", "{", "[":
                arr.append(c)
            case ")":
                guard arr.last != nil, let c1 = arr.last, c1 == "(" else {
                    return false
                }
                arr.removeLast()
            case "]":
                guard arr.last != nil, let c1 = arr.last, c1 == "[" else {
                    return false
                }
                arr.removeLast()
            case "}":
                guard arr.last != nil, let c1 = arr.last, c1 == "{" else {
                    return false
                }
                arr.removeLast()
            default:
                break
        }
    }
    
    
    return arr.isEmpty
}

    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        for char in s {
            switch char {
                case "(", "[", "{":
                    stack.append(char)
                case ")":
                    if stack.last == nil {return false}
                    let last = stack.removeLast()
                    if last != "(" {return false}
                case "]":
                    if stack.last == nil {return false}
                    let last = stack.removeLast()
                    if last != "[" {return false}
                case "}":
                    if stack.last == nil {return false}
                    let last = stack.removeLast()
                    if last != "{" {return false}
                default:
                    break
            }
        }
        return stack.isEmpty
    }