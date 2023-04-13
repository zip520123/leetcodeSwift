//Validate Stack Sequences
//O(pushed+popped), O(pushed)
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var stack = [Int](), j = 0
        for i in 0..<pushed.endIndex {
            stack.append(pushed[i])
            while !stack.isEmpty && j<popped.endIndex && popped[j] == stack.last! {
                stack.removeLast()
                j += 1
            }
        }
        return stack.isEmpty
    }

//O(pushed+popped), O(pushed)
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var stack = [Int]()
        var i = 0, j = 0, n = pushed.endIndex
        while i < n, j < n {
            if stack.isEmpty {
                stack.append(pushed[i])
                i += 1
            } else {
                if stack.last! == popped[j] {
                    stack.removeLast()
                    j += 1
                } else {
                    stack.append(pushed[i])
                    i += 1
                }
            }
        }
        while !stack.isEmpty, j < n, stack.last! == popped[j] {
            stack.removeLast()
            j += 1
        }
        return stack.isEmpty
    }