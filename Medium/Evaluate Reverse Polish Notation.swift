//Evaluate Reverse Polish Notation
//O(n), O(n)
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for char in tokens {
            if let n = Int(char) {
                stack.append(n)
            } else if char == "+" {
                let n1 = stack.removeLast()
                let n2 = stack.removeLast()
                stack.append(n1+n2)
            } else if char == "/" {
                let n1 = stack.removeLast()
                let n2 = stack.removeLast()
                stack.append(n2/n1)
            } else if char == "-" {
                let n1 = stack.removeLast()
                let n2 = stack.removeLast()
                stack.append(n2-n1)
            } else if char == "*" {
                let n1 = stack.removeLast()
                let n2 = stack.removeLast()
                stack.append(n1*n2)
            }
        }
        return stack.last!
    }

//O(n), O(n)
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for token in tokens {
            if let n = Int(token) {
                stack.append(n)
            } else {
                let a = stack.removeLast()
                let b = stack.removeLast()
                switch token {
                    case "+":
                        stack.append(b+a)
                    case "-":
                        stack.append(b-a)
                    case "*":
                        stack.append(b*a)
                    case "/":
                        stack.append(b/a)
                    default:
                        break
                }    
            }
            
        }
        return stack.first!
    }