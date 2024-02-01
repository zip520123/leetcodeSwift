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

//O(n), O(n)
    func minRemoveToMakeValid(_ s: String) -> String {
        var stack = [Int]()
        var set = Set<Int>()
        let arr = Array(s)
        for i in 0..<arr.endIndex {
            let char = arr[i]
            switch char {
                case "(":
                    stack.append(i)
                case ")":
                    if let last = stack.last, arr[last] == "(" {
                        set.insert(i)
                        set.insert(last)
                        stack.removeLast()
                    }
                default:
                    break
            }
        }
        var res = ""
        for i in 0..<arr.endIndex {
            let char = arr[i]
            switch char {
                case "(",")":
                    if set.contains(i) {
                        res += String(char)
                    }
                default:
                    res += String(char)
            }
        }
        return res
    }

// O(n), O(n)
    func minRemoveToMakeValid(_ s: String) -> String {
        var stack = [Int]()
        var incorrect = Set<Int>()
        let arr = Array(s)
        for i in 0..<arr.endIndex {
            if arr[i] == ")" {
                if stack.isEmpty {
                    incorrect.insert(i)
                } else{
                    stack.removeLast()
                }
            }
            if arr[i] == "(" {
                stack.append(i)
            }
        }
        for i in stack {
            incorrect.insert(i)
        }
        var res = ""
        for i in 0..<arr.endIndex {
            if incorrect.contains(i) == false {
                res += String(arr[i])
            }
        }
        return res
    }