//Maximum Product of Word Lengths
//O(n^2), O(n), n = words
    func maxProduct(_ words: [String]) -> Int {
        var res = 0
        for i in 0..<words.endIndex-1 {
            let word1 = words[i]
            let set = Set(Array(word1))
            next: for j in i+1..<words.endIndex {
                let word2 = words[j]
                for char in word2 {
                    if set.contains(char) {
                        continue next
                    }
                }
                res = max(res, word1.count * word2.count)
            }
        }
        return res
    }