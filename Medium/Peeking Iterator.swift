//Peeking Iterator
class PeekingIterator {
    let arr: Array<Int>
    var index = 0
    init(_ arr: IndexingIterator<Array<Int>>) {
        self.arr = Array(arr)
    }
    
    func next() -> Int {
        let res = arr[index]
        index += 1
        return res
    }
    
    func peek() -> Int {
        let res = arr[index]
        
        return arr[index]
    }
    
    func hasNext() -> Bool {
        index < arr.endIndex
    }
}

class PeekingIterator {
    var arr: IndexingIterator<Array<Int>>
    var curr: Int?
    init(_ arr: IndexingIterator<Array<Int>>) {
        self.arr = arr
        curr = self.arr.next()
    }
    
    func next() -> Int {
        let res = curr!
        curr = arr.next()
        return res
    }
    
    func peek() -> Int {
        curr!
    }
    
    func hasNext() -> Bool {
        curr != nil
    }
}