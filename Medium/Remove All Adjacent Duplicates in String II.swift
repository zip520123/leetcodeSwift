//Remove All Adjacent Duplicates in String II
//O(n) O(n)
class Solution {
    struct Pair {
        let char: Character
        var count: Int
        init(_ char:Character) {
            self.char = char
            count = 1
        }
    }
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        let sArr = Array(s)
        var stack = [Pair]()
        for char in sArr {
            if stack.isEmpty {
                stack.append(Pair(char))
            } else {
                if stack.last!.char == char {
                    var lastPair = stack.removeLast()
                    lastPair.count += 1
                    if lastPair.count < k {
                        stack.append(lastPair)
                    }
                } else {
                    stack.append(Pair(char))
                }
            }
        }
        
        var res = [Character]()
        for pair in stack {
            for _ in 0..<pair.count {
                res.append(pair.char)
            }
        }
        return String(res)
    }
}

//O(n), O(n)
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        var stack = [(char: Character, count: Int)]()
        for char in s {
            if stack.isEmpty {
                stack.append((char, 1))
            } else {
                let last = stack.removeLast()
                if last.char == char {
                    let newCount = last.count + 1
                    if newCount < k {
                        stack.append((char, newCount))    
                    }
                } else {
                    stack.append(last)
                    stack.append((char, 1))
                }
            }
        }
        var res = stack.map { (char, count) -> String in 
                             var curr = ""
                             for _ in 0..<count {
                                 curr += String(char)
                             }
                             return curr
                            }
                    .joined()
        return res
    }