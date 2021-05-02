//Zigzag Iterator

class ZigzagIterator {
    var arr = [Int]()
    init(_ v1: [Int], _ v2: [Int]) {//O(v1 + v2)
        var flag = true
        var l = 0, r = 0
        while l < v1.endIndex && r < v2.endIndex { 
            if flag {
                arr.append(v1[l])
                l += 1
            } else {
                arr.append(v2[r])
                r += 1
            }
            flag = !flag
        }
        while l < v1.endIndex { 
            arr.append(v1[l])
            l += 1
        }
        while r < v2.endIndex { 
            arr.append(v2[r])
            r += 1
        }
    }
    
    func next() -> Int { //O(1)
        arr.removeFirst()
    }
    
    func hasNext() -> Bool { //O(1)
        arr.isEmpty == false
    }
}

class ZigzagIterator {
    var arr = [Int]()
    init(_ v1: [Int], _ v2: [Int]) {
        var queue = [v1,v2].filter {$0.isEmpty == false}
        
        while queue.isEmpty == false {
            let temp = queue
            queue.removeAll()
            for i in 0..<temp.endIndex {
                var list = temp[i]
                arr.append(list.removeFirst())
                if list.isEmpty == false {
                    queue.append(list)
                }
            }
        }
        
    }
    
    func next() -> Int {
        arr.removeFirst()
    }
    
    func hasNext() -> Bool {
        arr.isEmpty == false
    }
}