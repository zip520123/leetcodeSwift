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

class NestedIterator {
    private var index = 0
    let arr: [Int]
    init(_ nestedList: [NestedInteger]) {
        arr = nestedList.flatMap { NestedIterator.toIntArray($0) }
    }
    
    static func toIntArray(_ nestedList: NestedInteger) -> [Int] {
        if nestedList.isInteger() {
            return [nestedList.getInteger()]
        } else {
            return nestedList.getList().flatMap { NestedIterator.toIntArray($0) }
        }
    }
    
    func next() -> Int {
        let res = arr[index]
        index += 1
        return res
    }
    
    func hasNext() -> Bool {
        index < arr.endIndex
    }
}