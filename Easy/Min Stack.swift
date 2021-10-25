//Min Stack
class MinStack {
    var arr = [Int]()
    var minArr = [Int]()
    func push(_ val: Int) {
        arr.append(val)
        if minStack.last == nil || minStack.last! >= val {
            minStack.append(val)
        }
    }
    
    func pop() {
        let last = arr.removeLast()
        if let minArrLast = minArr.last {
            if minArrLast == last {
                minArr.removeLast()
            }
        }
    }
    
    func top() -> Int {
        arr.last ?? 0
    }
    
    func getMin() -> Int {
        minArr.last ?? 0
    }
}