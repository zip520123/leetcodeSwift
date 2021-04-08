//Reverse Vowels of a String
    func reverseVowels(_ s: String) -> String {
        let set = Set<Character>("aeiouAEIOU")
        var sArr = Array(s)
        var l = 0, r = sArr.endIndex - 1
        while l < r {
            while set.contains(sArr[l]) == false && l < r {
                l += 1
            }
            while set.contains(sArr[r]) == false && l < r {
                r -= 1
            }
            if set.contains(sArr[l]) && set.contains(sArr[r]) {
                (sArr[l],sArr[r]) = (sArr[r],sArr[l])
                l += 1
                r -= 1
            }
        }
        return String(sArr)
    }