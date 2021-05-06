//First Unique Number
class FirstUnique {
    class Node {
        var next: Node?
        var prev: Node?
        var val: Int
        init(_ val: Int) {
            self.val = val
        }
    }
    var map = [Int:Node]()
    let head: Node
    
    init(_ nums: [Int]) {  //O(n)
        head = Node(-1)
        head.next = head
        head.prev = head
        
        for n in nums {
            add(n)
        }
    }
    
    func remove(_ node: Node) {
        let prev = node.prev
        let next = node.next
        prev?.next = next
        next?.prev = prev
        node.next = nil
        node.prev = nil
    }
    func insert(_ node: Node) { 
        let last = head.prev
        last?.next = node
        node.prev = last
        node.next = head
        head.prev = node
    }
    
    func showFirstUnique() -> Int { //O(1)
        return head.next?.val ?? -1 
    }
    
    func add(_ n: Int) { //O(1)
        if map[n] == nil {
            let node = Node(n)
            map[n] = node
            insert(node)
        } else {
            let node = map[n]!
            remove(node)
        }
    }
}   


class FirstUnique {
    var arr = [Int]()
    var dict = [Int:Int]()
    init(_ nums: [Int]) { //O(n)
        for n in nums {
            dict[n, default:0] += 1
            if dict[n]! == 1 {
                arr.append(n)
            }
        }
    }
    
    func showFirstUnique() -> Int { //O(n)
        for n in arr {
            if dict[n]! == 1 {
                return n
            }
        }
        return -1
    }
    
    func add(_ value: Int) { //O(1)
        dict[value, default:0] += 1
        if dict[value]! == 1 {
            arr.append(value)
        }
    }
}