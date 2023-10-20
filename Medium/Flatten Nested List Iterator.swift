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

class NestedIterator {
    private var arr = [Int]()
    init(_ nestedList: [NestedInteger]) {
        var queue = nestedList
        
        var hasNest = false
        repeat {
            let temp = queue
            queue.removeAll()
            hasNest = false
            for node in temp {
                if node.isInteger() {
                    queue.append(node)
                } else {
                    queue += node.getList()
                    hasNest = true
                }
            }
        } while hasNest
        arr = queue.map { $0.getInteger() }
    }
    
    func next() -> Int {
        arr.removeFirst()
    }
    
    func hasNext() -> Bool {
        !arr.isEmpty
    }
}

class NestedIterator {
    let arr: [Int]
    private var index = 0
    init(_ nestedList: [NestedInteger]) {
        var queue = nestedList
        var arr = [Int]()
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if node.isInteger() {
                arr.append(node.getInteger())
            } else {
                queue = node.getList() + queue
            }
        }
        self.arr = arr
    }
    
    func next() -> Int {
        defer { index += 1 }
        return arr[index]
    }
    
    func hasNext() -> Bool {
        index < arr.endIndex
    }
}


class NestedIterator {
    private var nestedList: [NestedInteger]
    private var curr: NestedInteger?
    
    init(_ nestedList: [NestedInteger]) {
        self.nestedList = nestedList
        curr = getCurrent()
    }
    
    func next() -> Int {
        let res = curr!.getInteger()
        curr = getCurrent()
        return res
    }
    
    func hasNext() -> Bool {
        curr != nil
    }
    
    
    func getCurrent() -> NestedInteger? {
        if nestedList.isEmpty { return nil }
        let nestInteger = nestedList.removeFirst()
        
        if nestInteger.isInteger() {
            return nestInteger
        } else {
            let list = nestInteger.getList()
            nestedList = list + nestedList
            return getCurrent()
        }
    }
}

class NestedIterator {

    let arr: [Int]
    private var index = 0
    init(_ nestedList: [NestedInteger]) {
        var arr = [Int]()
        for subArr in nestedList.map { Self.dfs($0) } {
            arr += subArr
        }
        self.arr = arr
    }

    static func dfs(_ n: NestedInteger) -> [Int] {
        
        if n.isInteger() {
            return [n.getInteger()]
        } else {
            let subArrs = n.getList().map { Self.dfs($0) }
            var arrs = [Int]()
            for arr in subArrs {
                arrs += arr
            }
            return arrs
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