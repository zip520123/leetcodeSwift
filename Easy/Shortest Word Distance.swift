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