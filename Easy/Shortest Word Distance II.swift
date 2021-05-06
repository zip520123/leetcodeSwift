//Shortest Word Distance II
//O(n) TLE
class WordDistance {
    var dict = [String:Int]()
    let words : [String]
    init(_ wordsDict: [String]) {
        for (i, w) in wordsDict.enumerated() {
            dict[w] = i
        }
        words = wordsDict
    }
    
    func shortest(_ word1: String, _ word2: String) -> Int { //O(dict)
        var val1 = -1, val2 = -1
        var res = Int.max
        for (i,w) in words.enumerated() {
            if w == word1 {
                val1 = i
            }
            if w == word2 {
                val2 = i
            }
            if val1 != -1 && val2 != -1 {
                res = min(res, abs(val1 - val2))
            }
        }
        return res
    }
}
//O(word1.indices + word2.indices)
class WordDistance {
    var dict = [String:[Int]]()
    
    init(_ wordsDict: [String]) { //O(n)
        for (i, w) in wordsDict.enumerated() {
            dict[w, default:[]].append(i)
        }
    }
    
    func shortest(_ word1: String, _ word2: String) -> Int { //O(word1.indices + word2.indices)
        let list1 = dict[word1]!, list2 = dict[word2]!
        var l = 0, r = 0
        var res = Int.max
        while l < list1.endIndex && r < list2.endIndex {
            res = min(res, abs(list1[l] - list2[r]))
            if list1[l] < list2[r] {
                l += 1
            } else {
                r += 1
            }
        }
        return res
    }
}

