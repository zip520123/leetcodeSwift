//Maximum Number of Vowels in a Substring of Given Length
//O(n),O(n)
class Solution {
    func maxVowels(_ s: String, _ k: Int) -> Int {
        var res = 0
        var l=0,r=0, currVowel=0
        let arr = Array(s)
        while r<arr.endIndex {
            let char = arr[r]
            if isVowel(char) {
                currVowel += 1
            }
            if r-l+1>k {
                let left = arr[l]
                if isVowel(left) {
                    currVowel -= 1
                }
                l += 1
            }
            res = max(res, currVowel)
            r += 1
        }
        return res
    }
    func isVowel(_ char: Character) -> Bool {
        switch char {
            case "a","e","i","o","u":
            return true
            default:
            return false
        }
    }
}