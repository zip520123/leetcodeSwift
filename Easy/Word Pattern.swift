//Word Pattern
//O(p+s),O(p+s)
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        var dict = [Character: String]()
        let p1 = Array(pattern), p2 = s.split(separator: " ")
        if p1.count != p2.count {return false}
        var seen = Set<String>()
        for (p, t) in zip(p1,p2) {
            let text = String(t)
            if dict[p] == nil {
                if seen.contains(text) {
                    return false
                }
                dict[p] = text
                seen.insert(text)
                
            } else {
                if dict[p]! != text {
                    return false
                }
            }
        }
        return true
    }

//O(p+s), O(p+s)
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        var dict = [Character: String]()
        var pDict = [String: Character]()
        let arr = Array(pattern)
        let sArr = s.split(separator: " ")
        if arr.endIndex != sArr.endIndex {return false}
        for i in 0..<arr.endIndex {
            let char = arr[i], s = String(sArr[i])
            if dict[char] == nil && pDict[s] == nil {
                dict[char] = s
                pDict[s] = char
            } else if dict[char] != nil && pDict[s] != nil {
                if dict[char]! != s || pDict[s]! != char {
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }