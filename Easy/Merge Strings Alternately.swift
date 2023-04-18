//Merge Strings Alternately
//O(n), O(n)
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        let arr1 = Array(word1), arr2 = Array(word2)
        var res = [Character]()
        var i = 0
        while i < arr1.endIndex && i<arr2.endIndex {
            res.append(arr1[i])
            res.append(arr2[i])
            i += 1
        }
        while i<arr1.endIndex {
            res.append(arr1[i])
            i += 1
        }
        while i<arr2.endIndex {
            res.append(arr2[i])
            i += 1
        }
        return String(res)
    }