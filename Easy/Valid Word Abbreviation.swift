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

// O(w+a), O(w+a)
func validWordAbbreviation(_ word: String, _ abbr: String) -> Bool {
    let a1 = Array(word), a2 = Array(abbr)
    var l = 0, r = 0
    while l < a1.endIndex && r < a2.endIndex {
        if a1[l] == a2[r] {
            l += 1
            r += 1
        } else {
            if var currN = Int(String(a2[r])) {
                if currN == 0 { return false }
                while r+1<a2.endIndex, let nextN = Int(String(a2[r+1])) {
                    currN *= 10
                    currN += nextN
                    r += 1
                }
                r += 1
                for _ in 0..<currN {
                    l += 1
                }
            } else {
                return false
            }
        }
    }
    return l == a1.endIndex && r == a2.endIndex
}