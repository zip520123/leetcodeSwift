//Permutation in String
//O(s1+s2) O(s1)
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var dict = [Character: Int]()
        var count = s1.count
        for char in s1 {
            dict[char, default:0] += 1
        }
        let sArr = Array(s2)
        var l = 0, r = 0
        while r < sArr.endIndex {
            let char = sArr[r]
            dict[char, default:0] -= 1
            if dict[char,default:0] >= 0 {
                count -= 1
                if count == 0 {
                    return true
                }
            }
            while dict[char,default:0] < 0 {
                let leftChar = sArr[l]
                dict[leftChar]! += 1
                if dict[leftChar]! > 0 {
                    count += 1
                }
                l += 1
            }
            r += 1
        }
        return false
    }