//Short Encoding of Words
//O(n log n), O(n)
class Solution {
    class Trie {
        var dict = [Character: Trie]()
        var isCovered = false
    }
    func minimumLengthEncoding(_ words: [String]) -> Int {
        let root = Trie()
        var res = 0
        let words = words.sorted { a, b in a.count > b.count }
        for word in words {
            var curr = root
            let arr = Array(word).reversed()
            for (i,char) in arr.enumerated() {
                if curr.dict[char] == nil {
                    curr.dict[char] = Trie()
                }
                curr = curr.dict[char]!
                if i == word.count-1 && curr.isCovered == false {
                    res += word.count + 1
                }
                curr.isCovered = true
            }
            
        }
        return res
    }
}