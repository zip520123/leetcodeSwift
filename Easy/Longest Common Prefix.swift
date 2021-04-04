/*Longest Common Prefix*/
//O(nlogn) O(strs)
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.endIndex == 0 { return ""}
        if strs.endIndex == 1 {return strs[0] }
        let left = longestCommonPrefix(Array(strs[0..<strs.endIndex>>1]))
        let right = longestCommonPrefix(Array(strs[strs.endIndex>>1..<strs.endIndex]))
        return compare(left,right)
    }
    
    func compare(_ s1: String,_ s2: String) -> String {
        if s1 == "" || s2 == "" {return ""}
        var i = 0 
        let s1Arr = Array(s1), s2Arr = Array(s2)
        while i < s1Arr.endIndex && i < s2Arr.endIndex && s1Arr[i] == s2Arr[i] {
            i += 1
        }
        return String(s1Arr[0..<i])
    }
}
//O(S) O(s)
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.endIndex == 0 {return ""}
        if strs.endIndex == 1 {return strs[0]}
        var pre = Array(strs[0])
        for i in 1..<strs.endIndex {
            let curr = Array(strs[i])
            var index = 0
            while index < pre.endIndex && index < curr.endIndex && pre[index] == curr [index] {
                index += 1    
            }
            pre = Array(pre[0..<index])
            if pre.endIndex == 0 {break}
        }
        return String(pre)
    }