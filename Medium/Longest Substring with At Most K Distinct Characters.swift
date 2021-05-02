//Longest Substring with At Most K Distinct Characters
//O(n) O(n)
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        var dict = [Character: Int]()
        let sArr = Array(s)
        var count = 0
        var l = 0, r = 0, res = 0
        while r < sArr.endIndex {
            let char = sArr[r]
            dict[char,default:0] += 1
            if dict[char]! == 1 {
                count += 1
            }
            while count > k {
                let leftChar = sArr[l]
                dict[leftChar]! -= 1
                if dict[leftChar]! == 0 {
                    count -= 1
                }
                l += 1
            }
            res = max(res, r - l + 1)
            r += 1
        }
        return res
    }