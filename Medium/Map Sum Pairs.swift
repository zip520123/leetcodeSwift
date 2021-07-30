//Map Sum Pairs
//O(n), O(n), n = key.length
class MapSum {
    class Trie {
        var dict = [Character: Trie]()
        var sum = 0
    }
    let root = Trie()
    var wordToVal = [String: Int]()
    
    func delete(_ key: String, _ val: Int) {
        insertNode(key, -val)    
    }
    func insertNode(_ key: String, _ val: Int) {
        var curr = root
        for char in key {
            if curr.dict[char] == nil {
                curr.dict[char] = Trie()
            }
            curr = curr.dict[char]!
            curr.sum += val
        }
    }
    func insert(_ key: String, _ val: Int) {
        if wordToVal[key] != nil {
            delete(key, wordToVal[key]!)
        }
        wordToVal[key] = val
        insertNode(key, val)
    }
    
    func sum(_ prefix: String) -> Int {
        var curr = root
        for char in prefix {
            if curr.dict[char] == nil {
                return 0
            }
            curr = curr.dict[char]!
        }
        return curr.sum
    }
}
//
class MapSum {
    class Trie {
        var dict = [Character: Trie]()
        var sum = 0
    }
    let root = Trie()
    var wordToVal = [String: Int]()
    
    func insert(_ key: String, _ val: Int) {
        let delta = val - wordToVal[key, default: 0] 
        wordToVal[key] = val
        var curr = root
        for char in key {
            if curr.dict[char] == nil {
                curr.dict[char] = Trie()
            }
            curr = curr.dict[char]!
            curr.sum += delta
        }
    }
    
    func sum(_ prefix: String) -> Int {
        var curr = root
        for char in prefix {
            if curr.dict[char] == nil {
                return 0
            }
            curr = curr.dict[char]!
        }
        return curr.sum
    }
}
//

class MapSum {
    var wordToVal = [String: Int]()
    var dict = [String: Int]()
    
    func insert(_ key: String, _ val: Int) {
        let delta = val - wordToVal[key, default: 0]
        wordToVal[key] = val
        let kArr = Array(key)
        for i in 0..<key.count {
            let prefix = String(kArr[0...i])
            dict[prefix, default:0] += delta
        }
    }
    
    func sum(_ prefix: String) -> Int {
        return dict[prefix, default: 0]
    }
}