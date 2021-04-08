//Implement Magic Dictionary
//dictionary TLE
// class MagicDictionary {
//     var set = Set<String>() 
    
//     func buildDict(_ dictionary: [String]) {
//         set = Set(dictionary)
//     }
    
//     func search(_ searchWord: String) -> Bool { // O(word.length*24)
//         let sArr = Array(searchWord)
//         for i in 0..<sArr.endIndex {
//             let currChar = sArr[i]
//             for char in "abcdefghijklmnopqrstuvwxyz" {
//                 if char != currChar {
//                     let newWord = String(sArr[0..<i] + String(char) + sArr[i+1..<sArr.endIndex])
//                     if set.contains(newWord) {
//                         return true
//                     }
//                 }
//             }
//         }
//         return false
//     }
// }

class MagicDictionary {
    class Trie {
        var dict = [Character:Trie]()
        var isEnd = false
    }
    let root = Trie()
    func buildDict(_ dictionary: [String]) {
        for word in dictionary {
            var curr = root
            let wArr = Array(word)
            for char in wArr {
                if curr.dict[char] == nil {
                    curr.dict[char] = Trie()
                }
                curr = curr.dict[char]!
            }
            curr.isEnd = true
        }    
    }
    
    func search(_ node: Trie, _ word: String) -> Bool {
        var curr = node
        let wArr = Array(word)
        for char in wArr {
            if curr.dict[char] == nil {
                return false
            }
            curr = curr.dict[char]!
        }
        return curr.isEnd
    }

    func search(_ searchWord: String) -> Bool {
        var curr = root
        let wArr = Array(searchWord)
        for (i, char) in wArr.enumerated() {
            for (key,node) in curr.dict where key != char {
                if search(node, String(wArr[i+1..<wArr.endIndex])) {
                    return true
                }
            }
            if curr.dict[char] == nil {
                return false
            }
            curr = curr.dict[char]!
        }
        
        return false
    }
}

class MagicDictionary { //O(words * searchWord.length) O(dictionary)
    var arr = [String]()
    func buildDict(_ dictionary: [String]) {
        arr = dictionary
    }
    
    func search(_ searchWord: String) -> Bool {
        let sArr = Array(searchWord)
        for word in arr {
            if word.count == sArr.endIndex {
                let wArr = Array(word)
                var i = 0
                var diff = 0
                for i in 0..<wArr.endIndex {
                    if wArr[i] != sArr[i] {diff += 1}
                }
                if diff == 1 {
                    return true
                }
            }
        }
        return false
    }
}

let mD = MagicDictionary()
mD.buildDict(["llo"])
// mD.buildDict(["hello","leetcode"])
print(mD.search("llo"))
print(mD.search("hllo"))