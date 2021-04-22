//Word Break II
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        var res = [String]()
        
        func dfs(_ path:[String], _ s: String) {
            if s == "" {
                res.append(path.joined(separator:" "))
                return 
            }
            let sArr = Array(s)
            
            for word in wordDict {
                let wArr = Array(word)
                var i = 0
                while i < sArr.endIndex && i < wArr.endIndex && sArr[i] == wArr[i] {
                    i += 1
                }
                if i == wArr.endIndex {
                    dfs(path+[word], String(sArr[i..<sArr.endIndex]))
                }
            }
            
        }
        dfs([],s)
        
        return res
    }