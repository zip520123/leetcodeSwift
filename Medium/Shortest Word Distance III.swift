//Shortest Word Distance III
//O(word1.indices + word2.indices) O(words)
    func shortestWordDistance(_ wordsDict: [String], _ word1: String, _ word2: String) -> Int {
        var dict = [String:[Int]]()
        for (i, w) in wordsDict.enumerated() {
            dict[w, default:[]].append(i)
        }
        let list1 = dict[word1]!, list2 = dict[word2]!
        var l = 0, r = 0, res = Int.max
        while l < list1.endIndex && r < list2.endIndex {
            if list1[l] != list2[r] {
                res = min(res, abs(list1[l]-list2[r]))    
            }
            
            if list1[l] < list2[r] {
                l += 1
            } else {
                r += 1
            }
        }
        return res
    }