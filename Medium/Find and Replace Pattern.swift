//Find and Replace Pattern
//O(n+p), O(n+p), n = words, p = pattern
    func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
        
        let pArr = Array(pattern)
        var res = [String]()
        next:for word in words {
            let wArr = Array(word)
            if wArr.endIndex != pArr.endIndex {continue}
            var m1 = [Character:Character](), m2 = m1
            for (char1, char2) in zip(wArr,pArr) {
                if m1[char1] == nil && m2[char2] == nil {
                    m1[char1] = char2
                    m2[char2] = char1
                } else if m1[char1] == nil || m2[char2] == nil {
                    continue next
                } else if m1[char1]! != char2 || m2[char2]! != char1 {
                    continue next
                }
            }
            res.append(word)
        }
        return res
        
    }

        func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
        var res = [String]()
        let pArr = Array(pattern)
        nextWord: for word in words {
            var dict = [Character: Character]()
            var dict2 = [Character: Character]()
            let wArr = Array(word)
            for i in 0..<word.count {
                let leftChar = wArr[i]
                let rightChar = pArr[i]
                if dict[leftChar] == nil && dict2[rightChar] == nil{
                    dict[leftChar] = rightChar
                    dict2[rightChar] = leftChar
                } else if dict[leftChar] != rightChar || dict2[rightChar] != leftChar {
                    continue nextWord
                }
            } 
            res.append(word)
        }
        return res
    }