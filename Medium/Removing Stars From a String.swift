//Removing Stars From a String
//O(n), O(n)
    func removeStars(_ s: String) -> String {
        var stack = [Character]()
        for char in s {
            switch char {
                case "*":
                    stack.removeLast()
                default:
                    stack.append(char)
            }
        }
        return String(stack)
    }