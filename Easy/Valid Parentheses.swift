/*Valid Parentheses*/
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