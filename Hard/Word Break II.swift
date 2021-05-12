//Word Break II
//O(n^2 + 2^n + w), n = word.len, w = words.len
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

    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        
        var dict = [String: [String]]()
        func dfs(_ curr: String) -> [String] {
            if dict[curr] != nil {
                return dict[curr]!
            }
            var res = [String]()
            if curr == "" {
                res.append("")
                return res
            }
            
            let sArr = Array(curr)
            
            for word in wordDict {
                let wArr = Array(word)
                var i = 0
                while i < wArr.endIndex && i < sArr.endIndex && sArr[i] == wArr[i] {
                    i += 1
                }
                if i == wArr.endIndex  {
                    let restString = String(sArr[i...])
                    let list = dfs(restString)
                    
                    for sub in list {
                        if sub == "" {
                            res += [word]
                        } else {
                            res += [word + " " + sub]    
                        }
                    }
                }
                
            }
            dict[curr] = res
            return res
        }
        
        return dfs(s)
    }