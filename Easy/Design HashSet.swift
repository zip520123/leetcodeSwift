//Design HashSet
//O(1),O(n)
class MyHashSet {
    var arr = [Bool](repeating: false, count: 1000001)

    func add(_ key: Int) {
        arr[key] = true
    }
    
    func remove(_ key: Int) {
        arr[key] = false
    }
    
    func contains(_ key: Int) -> Bool {
        arr[key]
    }
}
