//Design HashMap
//O(1),O(1)
class MyHashMap {
    var arr = (0...Int(1E6)).map {_ in -1}

    func put(_ key: Int, _ value: Int) {
        arr[key] = value
    }
    
    func get(_ key: Int) -> Int {
        arr[key]
    }
    
    func remove(_ key: Int) {
        arr[key] = -1    
    }
}
