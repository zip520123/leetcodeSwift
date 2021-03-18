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
//dp time O(n) space O(n)
func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var dict = [String:Bool]()
    func dfs(_ s: String) -> Bool {
        if let res = dict[s] {
            return res
        }
        let scount = s.count
        if scount == 0 {
            return true
        }
        let arrS = Array(s)
        
        var res = false
        for word in wordDict {
            let arrW = Array(word)
            let wcount = arrW.count
            var i = 0
            while (i < wcount && i < scount) {
                if arrW[i] != arrS[i] {
                    break
                }
                i += 1
            }
            if i == wcount {
                res = res || dfs(String(arrS[wcount..<scount]))
            }
        }
        dict[s] = res
        return res
    }
    return dfs(s)
}

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var dict = Dictionary<String, Bool>()
    
    func dfs(_ s:String) -> Bool {
        if s.count == 0 {return true}
        if dict[s] != nil {
            return dict[s]!
        }
        var res = false
        for word in wordDict {
            if s.hasPrefix(word) {
                let sArr = Array(s)
                let rest = Array(sArr[word.count..<sArr.endIndex]).map{String($0)}.joined()
                res = res || dfs(rest)
            }
        }
        dict[s] = res
        return res
    }
    
    return dfs(s)
}