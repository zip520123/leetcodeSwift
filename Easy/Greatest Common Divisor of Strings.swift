//Greatest Common Divisor of Strings
//O(s1*s2), O(s1)
class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        var s1 = str1, s2 = str2
        if s1.count < s2.count {
            (s1, s2) = (s2, s1)
        }
        let arr1 = Array(s1), arr2 = Array(s2)
        var prefix = "", res = ""
        for i in 0..<arr2.endIndex {
            if arr1[i] == arr2[i] {
                prefix += String(arr1[i])
                if divied(s1, prefix) && divied(s2, prefix) {
                    res = prefix
                }
            } else {
                break
            }
        }
        return res
    }
    
    func divied(_ s: String, _ t: String) -> Bool {
        let arr1 = Array(s), arr2 = Array(t)
        if arr1.count % arr2.count != 0 {return false}
        var i = 0
        while i < arr1.endIndex {
            if arr1[i] != arr2[i%arr2.count] {
                return false
            }
            i += 1
        }
        return true
    }
}