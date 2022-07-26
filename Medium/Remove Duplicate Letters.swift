//Remove Duplicate Letters
//O(n), O(n)
    func removeDuplicateLetters(_ s: String) -> String {
        var stack = [Character]()
        var count = [Character: Int]()
        for char in s {
            count[char, default: 0] += 1
        }
        var visited = [Character: Bool]()
        for char in s {
            count[char]! -= 1
            if visited[char, default: false] {
                continue
            }
            while !stack.isEmpty && stack.last! > char && count[stack.last!]! > 0 {
                visited[stack.last!] = false
                stack.removeLast()
            }
            stack.append(char)
            visited[char] = true
        }
        return String(stack)
    }