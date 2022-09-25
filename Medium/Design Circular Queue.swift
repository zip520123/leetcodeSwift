//Design Circular Queue
class MyCircularQueue {
    let k: Int
    private var arr = [Int]()
    init(_ k: Int) {
        self.k = k
    }
    
    func enQueue(_ value: Int) -> Bool {
        if arr.endIndex < k {
            arr.append(value)
            return true
        } else {
            return false
        }
    }
    
    func deQueue() -> Bool {
        if arr.first != nil {
            arr.removeFirst()
            return true
        } 
        return false
    }
    
    func Front() -> Int {
        if arr.first != nil {
            return arr.first!
        }
        return -1
    }
    
    func Rear() -> Int {
        if arr.last != nil {
            return arr.last!
        }
        return -1
    }
    
    func isEmpty() -> Bool {
        arr.isEmpty
    }
    
    func isFull() -> Bool {
        arr.endIndex == k
    }
}
