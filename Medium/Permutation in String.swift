//Permutation in String
//O(s1+s2) O(s1)
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var dict = [Character: Int]()
        for char in s1 {
            dict[char, default:0] += 1
        }
        var count = s1.count
        var l = 0, r = 0
        let sArr = Array(s2)
        while r < sArr.endIndex {
            dict[sArr[r], default: 0] -= 1
            if dict[sArr[r]]! >= 0 {
                count -= 1  
            }
            while dict[sArr[r]]! < 0 {
                dict[sArr[l]]! += 1
                if dict[sArr[l]]! > 0 {count += 1}
                l += 1
            }
            if count == 0 {return true}
            r += 1
        }
        return false
        
    }