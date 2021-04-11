/*LRU Cache*/
//space O(n)
class LRUCache {
    class Node {
        var prev: Node?
        var next: Node?
        var val: Int
        var key: Int
        init(_ key: Int,_ val: Int) {
            self.val = val
            self.key = key
        }
    }
    
    let head: Node 
    let tail: Node 
    let capacity: Int
    
    var dict: [Int:Node] = [:]
    var size = 0
    
    init(_ capacity: Int) {
        self.capacity = capacity
        let node = Node(-1,-1)
        head = node
        let node2 = Node(-1,-1)
        tail = node2 //we don't even need tail
        head.next = tail
        tail.prev = head
    }
    
    func remove(_ node: Node) {
        let prev = node.prev
        let next = node.next
        prev?.next = next
        next?.prev = prev
        dict[node.key] = nil
    }
    
    func removeLast() {
        let node = tail.prev!
        remove(node)
    }
    
    func add(_ node: Node) {
        let currHead = head.next
        head.next = node
        node.prev = head
        node.next = currHead
        currHead?.prev = node
        dict[node.key] = node
    }
    //O(1)
    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            remove(node)
            add(node)
            return node.val
        } else {
            return -1
        }
    }
    //O(1)
    func put(_ key: Int, _ value: Int) {
        if capacity == 0 {return}
        if dict[key] == nil {
            if size == capacity {
                removeLast()
                size -= 1
            } 
            let node = Node(key,value)
            size += 1
            add(node)
        } else {
            let node = dict[key]!
            node.val = value
            remove(node)
            add(node)
        }
    }
}

class LRUCache {
    class Node {
        var prev: Node?
        var next: Node?
        var key: Int
        var val: Int
        init(_ key: Int, _ val: Int) {
            self.key = key
            self.val = val
        }
    }
    var dict = [Int:Node]()
    let capacity : Int
    let head: Node
    
    
    var size = 0
    init(_ capacity: Int) {
        self.capacity = capacity
        let node = Node(-1,-1)
        head = node
        head.next = head
        head.prev = head
    }
    
    func remove(_ node: Node) {
        let next = node.next
        let prev = node.prev
        prev?.next = next
        next?.prev = prev
        dict[node.key] = nil
    }
    
    func add(_ node: Node) {
        let currHead = head.next
        head.next = node
        node.prev = head
        node.next = currHead
        currHead?.prev = node
        dict[node.key] = node
    }
    
    func removeLast() {
        remove(head.prev!)
    }
    
    func get(_ key: Int) -> Int {
        if dict[key] == nil {
            return -1
        } else {
            let node = dict[key]!
            remove(node)
            add(node)
            return node.val
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if capacity == 0 {return}
        if let node = dict[key] {
            node.val = value
            remove(node)
            add(node)
        } else {
            if size == capacity {
                removeLast()
                size -= 1
            }
            let node = Node(key,value)
            add(node)
            size += 1
        }
    }
}