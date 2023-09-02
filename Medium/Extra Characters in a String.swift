// Extra Characters in a String
// O(n^2), O(n)
class Solution {
    class Trie {
        var dict = [Character: Trie]()
        var n: Int?
    }

    func minExtraChar(_ s: String, _ dictionary: [String]) -> Int {
        let root = Trie()
        for word in dictionary {
            var curr = root
            for char in word {
                if curr.dict[char] == nil {
                    curr.dict[char] = Trie()
                }
                curr = curr.dict[char]!
            }
            curr.n = word.count
        }
        let arr = Array(s)
        var dict = [[Int]: Int]()
        func dfs(_ index: Int, _ rest: Int) -> Int {
            if index == arr.endIndex {return rest}
            if dict[[index,rest]] != nil {return dict[[index,rest]]!}
            var rest = rest
            var res = rest
            for i in index..<arr.endIndex {
                var curr = root
                var j = i
                while j < arr.endIndex && curr.dict[arr[j]] != nil {
                    curr = curr.dict[arr[j]]!
                    j += 1
                    if curr.n != nil {
                        res = min(res, dfs(j, rest-curr.n!))
                    }
                }
            }

            dict[[index,rest]] = res
            return res
        }

        return dfs(0, arr.endIndex)
    }
}
