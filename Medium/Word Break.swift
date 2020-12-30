/*Word Break*/
//time O(s^wordDict) space O(wordDict)
func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let set = Set(wordDict)
    func dfs(_ s: String) -> Bool {
        let arrS = Array(s)
        let scount = arrS.count
        if scount == 0 {
            return true
        }
        var res = false
        for word in set {
            var wordIndex = 0
            
            var wcount = word.count
            var arrW = Array(word)
            
            while wordIndex < wcount && wordIndex < scount {
                if arrW[wordIndex] != arrS[wordIndex] {
                    break
                }
                wordIndex += 1
            }
            if wordIndex == wcount {
                res = res || dfs(String(arrS[wcount..<scount])) 
            }
        }
        return res
    }
    return dfs(s)
}
//dp time O(n) space O(2n)
func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let set = Set(wordDict)
    var dp = [String: Bool]()
    func dfs(_ s: String) -> Bool {
        if let res = dp[s] {
            return res
        }
        let arrS = Array(s)
        let scount = arrS.count
        if scount == 0 {
            return true
        }
        var res = false
        for word in set {
            var wordIndex = 0
            
            var wcount = word.count
            var arrW = Array(word)
            
            while wordIndex < wcount && wordIndex < scount {
                if arrW[wordIndex] != arrS[wordIndex] {
                    break
                }
                wordIndex += 1
            }
            if wordIndex == wcount {
                res = res || dfs(String(arrS[wcount..<scount])) 
            }
        }
        dp[s] = res
        return res
    }
    return dfs(s)
}