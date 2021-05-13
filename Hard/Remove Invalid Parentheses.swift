//Remove Invalid Parentheses
//O(2^n) O(recursive stack) bfs
    func removeInvalidParentheses(_ s: String) -> [String] {
        var count = 0
        var stack = [Character]()
        let sArr = Array(s)
        for char in s {
            if char == "(" {
                stack.append(char)
            } else if char == ")"{
                if stack.isEmpty {
                    stack.append(char)
                } else {
                    if stack.last! == "(" {
                        stack.removeLast()
                        count += 1
                    } else {
                        stack.append(char)
                    }
                }
            }
        }
        
        var left = 0, right = 0
        for char in stack {
            if char == "(" {
                left += 1
            } else {
                right += 1
            }
        }
        var res = [String]()
        func dfs(_ index: Int, _ left: Int, _ right: Int, _ path: [Character], _ currLeft: Int, _ currRight: Int) {
            if index == sArr.endIndex {
                res.append(String(path))
                return
            }
            if sArr[index] == "(" {
                if left > 0 {
                    dfs(index+1, left-1, right, path, currLeft, currRight)
                }
                if currLeft < count {
                    dfs(index+1, left, right, path+["("], currLeft+1, currRight)    
                }
                
            } else if sArr[index] == ")" {
                if right > 0 {
                    dfs(index+1, left, right-1, path, currLeft, currRight)    
                }
                if currRight < currLeft {
                    dfs(index+1, left, right, path+[")"], currLeft, currRight+1)    
                }
            } else {
                dfs(index+1, left, right, path+[sArr[index]], currLeft, currRight) 
            }
        }
        dfs(0,left,right,[],0,0)
        if res.endIndex == 0 {
            return [""]
        }
        return Array(Set(res))
    }
    
//bfs
    func removeInvalidParentheses(_ s: String) -> [String] {
        var seen = Set<String>()
        var queue = [s]
        var res = [String]()
        
        while queue.isEmpty == false {
            let curr = queue.removeFirst()
            if let first = res.first, first.count > curr.count {
                break
            }
            let currArr = Array(curr)
            let (isValid, charNeedToRemove) = validate(curr)
            
            if isValid {
                res.append(curr)
            } else {
                var i = 0
                while i < currArr.endIndex {
                    if currArr[i] == charNeedToRemove {
                        let next = String(currArr[0..<i]+currArr[(i+1)...])
                        if seen.contains(next) == false {
                            queue.append(next)
                            seen.insert(next)
                        }
                    }
                    i += 1
                }
            }
        }

        return res
    }
    
    func validate(_ s: String) -> (Bool, Character) {
        var r = 0
        for char in s {
            if char == "(" {
                r += 1
            } else if char == ")" {
                r -= 1
                if r < 0 {
                    return (false, ")")
                }
            }
        }
        if r == 0 {
            return (true, " ")
        } else {
            return (false, "(")
        }         
    }

    //bfs
    class Solution {
    func removeInvalidParentheses(_ s: String) -> [String] {
        var res = [String]()
        var seen = Set<String>()
        var queue = [s]
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            if let prev = res.last, prev.count > curr.count {break}
            let (isValid, charNeedToRemove) = validate(curr)
            if isValid {
                res.append(curr)
                continue
            }
            let sArr = Array(curr)
            for i in 0..<sArr.endIndex {
                if sArr[i] == charNeedToRemove {
                    let newString = String(sArr[0..<i] + sArr[(i+1)...])
                    if seen.contains(newString) == false {
                        seen.insert(newString)
                        queue.append(newString)
                    }
                }
            }
        }
        return res
    }
    
    func validate(_ s: String) -> (Bool, Character) {
        var stack = [Character]()
        for char in s {
            if char == "(" {
                stack.append(char)
            } else if char == ")" {
                if stack.isEmpty == false {
                    if stack.last! == "(" {
                        stack.removeLast()
                    } else {
                        return (false, ")")
                    }
                } else {
                    stack.append(char)
                }
            }
        }
        if stack.isEmpty == false {
            return (false, stack.last!)
        } else {
            return (true, " ")
        }
    }
}