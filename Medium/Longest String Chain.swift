//Longest String Chain
//O(n), O(n), n = words.len
    func longestStrChain(_ words: [String]) -> Int {
        var dict = [Int:[String]]()
        var maxLen = 0
        for word in words {
            maxLen = max(maxLen, word.count)
            dict[word.count, default:[]].append(word)
        }
        var res = 0
        var i = maxLen, seen = Set<String>()
        
        func dfs(_ w: String, _ path: Int) {
            if seen.contains(w) {return}
            seen.insert(w)
            res = max(res, path)
            let wArr = Array(w)
            next: for pre in dict[w.count-1, default:[]] {
                var i = 0, j = 0, diff = 0
                let pArr = Array(pre)
                while i < pArr.endIndex && j < wArr.endIndex {
                    if pArr[i] != wArr[j] {
                        if diff == 1 {
                            continue next
                        }
                        diff += 1
                        j += 1
                    } else {
                        i += 1
                        j += 1    
                    }
                }
                if i == pArr.endIndex {
                    dfs(pre, path+1)
                }
            }

        }
        
        while i > res {
            for word in dict[i, default:[]] {
                dfs(word, 1)
            }
            i -= 1
        }
        return res
    }