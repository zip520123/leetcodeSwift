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