//Word Subsets
//O(words1*words2), O(words2), TLE
    func wordSubsets(_ words1: [String], _ words2: [String]) -> [String] {
        
        var arr = [[Character: Int]]()
        
        for s in words2 {
            var dict = [Character: Int]()
            for char in s {
                dict[char, default: 0] += 1
            }
            arr.append(dict)
        }
        
        var res = [String]()
        
        next: for w in words1 {
            for (i, item) in arr.enumerated() {
                var dict = item
                var count = 0
                for char in w {
                    dict[char, default:0] -= 1
                    if dict[char]! >= 0 {
                        count += 1
                    }
                }
                if count < words2[i].count {
                    continue next
                }
            }
            res.append(w)
        }
        return res
    }

//O(words1 + words2), O(words1 + words2)
    func wordSubsets(_ words1: [String], _ words2: [String]) -> [String] {

        var dict = [Character: Int]()
        
        for w in words2 {
            var curr = [Character: Int]()
            for char in w {
                curr[char, default: 0] += 1
            }
            for (key, val) in curr {
                dict[key] = max(dict[key] ?? 0, val)
            }
        }
        
        var res = [String]()
        next: for w in words1 {
            var curr = [Character: Int]()
            for char in w {
                curr[char, default: 0] += 1
            }
            for (key, val) in dict {
                if curr[key, default: 0] < val {
                    continue next
                }
            }
            res.append(w)
        }
        return res
    }