//Shortest Word Distance
//O(m+n) O(1)
    func shortestDistance(_ wordsDict: [String], _ word1: String, _ word2: String) -> Int {
        var i1 = -1, i2 = -1
        var res = wordsDict.endIndex
        for (i,word) in wordsDict.enumerated() {
            if word == word1 {
                i1 = i
            }
            if word == word2 {
                i2 = i
            }
            if i1 != -1 && i2 != -1 {
                res = min(res, abs(i1-i2))
            }
        }
        return res
    }
//O(word1.indices + word2.indices)
    func shortestDistance(_ wordsDict: [String], _ word1: String, _ word2: String) -> Int {
        var dict = [String:[Int]]()
        for (i, w) in wordsDict.enumerated() {
            dict[w, default:[]].append(i)
        }
        let list1 = dict[word1]!, list2 = dict[word2]!
        var l = 0, r = 0, res = Int.max
        while l < list1.endIndex && r < list2.endIndex {
            res = min(res, abs(list1[l]-list2[r]))
            if list1[l] < list2[r] {
                l += 1
            } else {
                r += 1
            }
        }
        return res
    }