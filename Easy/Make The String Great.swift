//Make The String Great
//O(n), O(n)
    func makeGood(_ s: String) -> String {
        var stack = [Character]()
        next: for char in s {
            if !stack.isEmpty {
                if (stack.last!.isLowercase && String(char) == stack.last!.uppercased()) || 
                   (stack.last!.isUppercase && String(char) == stack.last!.lowercased()) {
                       stack.removeLast()
                        continue next
                   }    
            }
            stack.append(char)
        }
        return String(stack)
    }