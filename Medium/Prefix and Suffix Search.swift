//Prefix and Suffix Search
//approch 1 TLE (word.len) * prefix + suffix
    func f(_ prefix: String, _ suffix: String) -> Int {
        for i in (0..<words.endIndex).reversed() { 
            let word = words[i]
            let wArr = Array(word), pArr = Array(prefix)
            var j = 0
            while j < wArr.endIndex && j < pArr.endIndex && wArr[j] == pArr[j]{
                j += 1
            }
            if j < pArr.endIndex {continue}
            let suArr = Array(suffix)
            j = suArr.endIndex - 1
            var k = wArr.endIndex - 1
            while j >= 0 && k >= 0 && suArr[j] == wArr[k] {
                j -= 1
                k -= 1
            }
            if j == -1 {
                return i
            } 
        }    
        return -1
    }

class WordFilter { // TLE
    var dict = [[String]:Int]()
    init(_ words: [String]) { 
        
        for (index,w) in words.enumerated() { //O(word.len ^ 3 * words.len)
            let wArr = Array(w)
            for i in 0..<wArr.endIndex {
                let prefix = String(wArr[0...i])
                for j in 0..<wArr.endIndex {
                    let suffix = String(wArr[j..<wArr.endIndex])
                    dict[[prefix,suffix]] = index
                }
            }
        }
    }

    func f(_ prefix: String, _ suffix: String) -> Int { // O(1)
        if let index = dict[[prefix,suffix]] {
            return index
        }
        return -1
    }
}

//space O((word.len ^ 2) * words.len)
class WordFilter { 
    class Trie {
        var dict = [Character: Trie]()
        var index = -1
    }
    let root = Trie()
    init(_ words: [String]) {
       for (index, word) in words.enumerated() { //O((word.len ^ 2) * words.len )

           let wArr = Array(word)
           for i in 0..<wArr.endIndex {
               let suffix = String(wArr[i..<wArr.endIndex])
               let target = suffix + "£" + word
               var curr = root 
               curr.index = index
               for char in target {
                   if curr.dict[char] == nil {
                       curr.dict[char] = Trie()
                   }
                   curr = curr.dict[char]!
                   curr.index = index
               }
           }

       } 
    }
    
    func f(_ prefix: String, _ suffix: String) -> Int { //O(prefix + suffix)
        var curr = root
        let target = suffix + "£" + prefix
        for char in target {
            if curr.dict[char] == nil {
                return -1
            }
            curr = curr.dict[char]!
        }
        return curr.index
    }
}