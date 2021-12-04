//Stream of Characters
class StreamChecker {
    class Trie {
        var dict = [Character: Trie]()
        var isEnd = false
    }
    var root = Trie()
    
    init(_ words: [String]) {
        for word in words {
            let rword = word.reversed()
            var curr = root
            for char in rword {
                if curr.dict[char] == nil {
                    curr.dict[char] = Trie()
                }
                curr = curr.dict[char]!
            }
            curr.isEnd = true
        }
    }

    var str = [Character]()

    func query(_ letter: Character) -> Bool {
        str.append(letter)
        return find(str)
    }

    func find(_ str: [Character]) -> Bool {
        var curr = root
        for char in str.reversed() {
            if curr.dict[char] == nil {
                return false
            }
            curr = curr.dict[char]!
            if curr.isEnd {
                return true
            }
        }
        return curr.isEnd
    }
}