//Remove All Adjacent Duplicates In String
//O(n) O(n)
class Solution {
    struct Pair {
        let char: Character
        var count: Int = 1
        init(_ char: Character){
            self.char = char
        }
    }
    func removeDuplicates(_ S: String) -> String {
        var stack = [Pair]()
        for char in S {
            if stack.isEmpty {
                stack.append(Pair(char))
            } else {
                let lastPair = stack.removeLast()
                if lastPair.char != char {
                    stack.append(lastPair)
                    stack.append(Pair(char))
                } 
            }
        }
        var res = [Character]()
        for pair in stack {
            res.append(pair.char)
        }
        return String(res)
    }
}

//O(n), O(n)
    func removeDuplicates(_ s: String) -> String {
        var stack = [Character]()
        for char in s {
            if !stack.isEmpty && stack.last! == char {
                stack.removeLast()
            } else {
                stack.append(char)
            }
        }
        return String(stack)
    }