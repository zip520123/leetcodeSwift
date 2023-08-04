/*Word Break*/
//O(s.length^3) O(s.length)
func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var dict = [String:Bool]()
    func dfs(_ s: String) -> Bool {
        if dict[s] != nil {return dict[s]!}
        if s == "" {return true}
        let sArr = Array(s)
        var res = false
        for word in wordDict {
            let wArr = Array(word)
            var i = 0
            while i < sArr.endIndex && i < wArr.endIndex && sArr[i] == wArr[i]{
                i += 1
            }
            if i == wArr.endIndex {
                res = res || dfs(String(sArr[i...]))
            }
        }
        dict[s] = res
        return res
    }
    
    return dfs(s)
}

//O(s.len^2 + wordDist.len), O(s.len + wordDist.len)
class Solution {

    class Trie {
        var dict = [Character: Trie]()
        var isEnd = false
    }

    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let root = Trie()
        for word in wordDict {
            var curr = root
            for char in word {
                if curr.dict[char] == nil {
                    curr.dict[char] = Trie()
                }
                curr = curr.dict[char]!
            }
            curr.isEnd = true
        }    

        var memo = [[Character]: Bool]()
        func dfs(_ arr: [Character]) -> Bool {
            if arr.isEmpty {return true}
            if memo[arr] != nil { return memo[arr]! }
            var res = false
            var curr = root
            for i in 0..<arr.endIndex {
                let char = arr[i]
                if curr.dict[char] != nil {
                    curr = curr.dict[char]!
                    if curr.isEnd == true {
                        res = res || dfs(Array(arr[(i+1)...]))
                    }
                    
                } else {
                    break
                }
            }
            memo[arr] = res
            return res
        }
        return dfs(Array(s))
    }
}