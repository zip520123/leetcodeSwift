//Longest Valid Parentheses
//O(n) O(n)
    func longestValidParentheses(_ s: String) -> Int {
        var stack = [-1]
        var res = 0
        for (i,char) in s.enumerated() {
            if char == "(" {
                stack.append(i)
            } else {
                stack.removeLast()
                if stack.isEmpty {
                    stack.append(i)
                } else {
                    res = max(res, i - stack.last!)
                }
            }
        }
        return res
    }