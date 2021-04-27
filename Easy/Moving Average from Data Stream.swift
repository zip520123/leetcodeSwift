//Moving Average from Data Stream
//O(n^2) O(n)
class MovingAverage {

    var arr = [Int]()
    let size: Int
    init(_ size: Int) {
        self.size = size
    }
    
    func next(_ val: Int) -> Double {
        arr.append(val)
        if arr.endIndex > size {
            arr.removeFirst()
        }
        let sum = arr.reduce(0,+)
        return Double(sum) / Double(arr.endIndex)
    }
}

//O(n) O(n)
class MovingAverage {

    let size: Int
    var sum = 0
    var queue = [Int]()
    init(_ size: Int) {
        self.size = size
    }
    
    func next(_ val: Int) -> Double {
        
        sum += val
        queue.append(val)
        if queue.endIndex > size {
            let first = queue.removeFirst()
            sum -= first
        }
        
        return Double(sum) / Double(queue.endIndex)
    }
}