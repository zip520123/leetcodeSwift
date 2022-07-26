//Maximum Product of Word Lengths
//O(n^2), O(n), n = words
    func maxProduct(_ words: [String]) -> Int {
        var res = 0
        for i in 0..<words.endIndex-1 {
            let set = Set(Array(words[i]))
            next: for j in i+1..<words.endIndex {
                for char in words[j] {
                    if set.contains(char) {
                        continue next
                    }
                }
                res = max(res, words[i].count * words[j].count)
            }
        }
        return res
    }