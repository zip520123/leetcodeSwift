//Validate Stack Sequences
//O(pushed+popped), O(pushed)
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var i = 0, j = 0
        var stack = [Int]()
        while i < pushed.endIndex {
            stack.append(pushed[i])
            i += 1
            while j < popped.endIndex && !stack.isEmpty && stack.last! == popped[j] {
                stack.removeLast()
                j += 1
            }
        }
        return stack.isEmpty
    }