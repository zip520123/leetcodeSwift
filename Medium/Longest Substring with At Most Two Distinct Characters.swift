//Longest Substring with At Most Two Distinct Characters
//O(n) O(n)
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        var set = Set<Character>()
        var dict = [Character:Int]()
        let sArr = Array(s)
        var l = 0, r = 0
        var res = 0
        while r < sArr.endIndex {
            let char = sArr[r]
            set.insert(char)
            dict[char,default:0] += 1
            while set.count == 3 {
                let leftChar = sArr[l]
                dict[leftChar]! -= 1
                if dict[leftChar]! == 0 {
                    set.remove(leftChar)
                }
                l += 1
            }
            res = max(res, r - l + 1)  
            
            r += 1
        }
        return res
    }
//without set
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        var count = 0
        var dict = [Character:Int]()
        let sArr = Array(s)
        var l = 0, r = 0
        var res = 0
        while r < sArr.endIndex {
            let char = sArr[r]
            
            dict[char,default:0] += 1
            if dict[char]! == 1 {
                count += 1
            }
            while count == 3 {
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