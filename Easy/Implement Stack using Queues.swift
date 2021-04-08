//Implement Stack using Queues
//two queue
class MyStack {
    var queue1 = [Int]()
    
    func push(_ x: Int) {
        queue1.append(x)
    }
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        var queue = [Int]()
        while queue1.endIndex > 1 {
            queue.append(queue1.removeFirst())
        }
        let x = queue1.first ?? 0
        queue1 = queue
        
        return x
    }
    /** Get the top element. */
    func top() -> Int {
        var queue = [Int]()
        while queue1.endIndex > 1 {
            queue.append(queue1.removeFirst())
        }
        let x = queue1.first ?? 0
        queue.append(queue1.removeFirst())
        queue1 = queue
        return x
    }

    func empty() -> Bool {
        return queue1.isEmpty
    }
}

//one queue 
class MyStack {
    var queue = [Int]()
    /** Push element x onto stack. */
    func push(_ x: Int) {
        queue.append(x)
        var k = queue.endIndex
        while k > 1 {
            queue.append(queue.removeFirst())
            k -= 1
        }
    }
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        queue.removeFirst()
    }
    /** Get the top element. */
    func top() -> Int {
        queue.first ?? 0
    }
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        queue.isEmpty
    }
}