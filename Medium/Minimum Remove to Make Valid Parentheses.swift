//Minimum Remove to Make Valid Parentheses
//O(n) O(n)
    func minRemoveToMakeValid(_ s: String) -> String {
        var stack = [Int]()
        var sArr = Array(s)
        for (i,char) in sArr.enumerated() {
            if char == "(" {
                stack.append(i)
            } else if char == ")" {
                if stack.isEmpty {
                    stack.append(i)
                } else {
                    if sArr[stack.last!] == "(" {
                        stack.removeLast()
                    } else {
                        stack.append(i)
                    }
                }
            }
        }
        for i in stack.reversed() {
            sArr.remove(at: i)
        }
        return String(sArr)
    }