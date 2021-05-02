//Valid Word Abbreviation
//O(w+a) O(w+a)
    func validWordAbbreviation(_ word: String, _ abbr: String) -> Bool {
        let wArr = Array(word), aArr = Array(abbr)
        var i = 0, j = 0
        while i < wArr.endIndex && j < aArr.endIndex {
            if wArr[i] == aArr[j] {
                i += 1; j += 1
            } else if let n = Int(String(aArr[j])) {
                if n == 0 {return false}
                var num = 0
                while j < aArr.endIndex, let n = Int(String(aArr[j])) {
                    num = num*10 + n
                    j += 1
                }
                i += num
            } else {
                return false
            }
        }
        return i == word.count && j == abbr.count
    }