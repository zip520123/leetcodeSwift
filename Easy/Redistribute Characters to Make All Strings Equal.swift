// Redistribute Characters to Make All Strings Equal
// O(n), O(n)
    func makeEqual(_ words: [String]) -> Bool {
        var memo = [Character: Int]()
        for word in words {
            for char in word {
                memo[char, default: 0] += 1
            }
        }    
        let n = words.endIndex
        for (key, val) in memo {
            if val % n != 0 {
                return false
            }
        }
        return true
    }