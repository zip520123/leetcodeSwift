/* Longest Substring Without Repeating Characters*/
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var left = 0, right = 0
        let scount = s.count
        var res = 0
        var dict : [Character: Int] = [:]
        let arrs = Array(s)
        
        while(right<scount) {
            let c = arrs[right]
            dict[c, default:0] += 1 
            while dict[c]! > 1 {
                let c2 = arrs[left]
                dict[c2]! -= 1
                left += 1
            }     
            let localMax = right - left + 1
            res = max(res, localMax)
            right += 1
        }
        
        return res
    }
}