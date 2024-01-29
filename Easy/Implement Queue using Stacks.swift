//Implement Queue using Stacks
//O(n), O(n)
class MyQueue {
    var stack = [Int]()
    var stack2 = [Int]()
    
    func push(_ x: Int) {
        stack.append(x)
    }
    
    func pop() -> Int {
        
        if stack2.isEmpty {
            while !stack.isEmpty {
                stack2.append(stack.removeLast())
            }    
        }
        if let last = stack2.last {
            stack2.removeLast()
            return last
        } else {
            return 0
        }
        
    }
    
    func peek() -> Int {
        if stack2.isEmpty {
            while !stack.isEmpty {
                stack2.append(stack.removeLast())
            }    
        }
        if let last = stack2.last {
            return last
        } else {
            return 0
        }
    }
    
    func empty() -> Bool {
        stack.isEmpty && stack2.isEmpty
    }
}

//
class MyQueue {
    var s1 = [Int]()
    var s2 = [Int]()
    
    func push(_ x: Int) {
        s1.append(x)
    }
    
    func pop() -> Int {
        if s2.isEmpty {
            while !s1.isEmpty {
                s2.append(s1.removeLast())
            }
        }
        return s2.removeLast()
    }
    
    func peek() -> Int {
        if s2.isEmpty {
            while !s1.isEmpty {
                s2.append(s1.removeLast())
            }
        }
        return s2.last!
    }
    
    func empty() -> Bool {
        s1.isEmpty && s2.isEmpty
    }
}