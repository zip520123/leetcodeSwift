// Score of Parentheses
//O(n), O(n)
func scoreOfParentheses(_ s: String) -> Int {
    var stack = [Int](), res = 0
    for char in s {
        switch char {
            case "(":
                stack.append(0)
            case ")":
                var temp = 0
                while !stack.isEmpty && stack.last! != 0 {
                    let last = stack.removeLast()
                    temp += last
                }
                stack.removeLast()
                if temp == 0 {
                    stack.append(1)
                } else {
                    stack.append(temp*2)    
                }
                
            default:
                break  
        }
    }
    return stack.reduce(0,+)
}