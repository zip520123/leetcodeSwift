//Flatten Nested List Iterator
class NestedIterator {
    private var arr = [Int]()
    init(_ nestedList: [NestedInteger]) {
        arr = nestedList.map {unwrap($0)}.reduce([Int](),+)
    }
    
    func unwrap(_ n: NestedInteger) -> [Int] {
        var res = [Int]()
        if n.isInteger() {
            return [n.getInteger()]
        } else {
            return n.getList()
            .map{unwrap($0)}
            .reduce([Int](), + )
        }
    }
    
    func next() -> Int {
        return arr.removeFirst()
    }
    
    func hasNext() -> Bool {
        return !arr.isEmpty
    }
}

class NestedIterator {
    private var arr = [Int]()
    init(_ nestedList: [NestedInteger]) {
        arr = nestedList.flatMap { dfs($0) }
    }
    
    func dfs(_ n: NestedInteger) -> [Int] {
        return n.isInteger() ? [n.getInteger()] : n.getList().flatMap {dfs($0)}
    }
    
    func next() -> Int {
        arr.removeFirst()
    }
    
    func hasNext() -> Bool {
        !arr.isEmpty
    }
}