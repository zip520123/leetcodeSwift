//Reverse Words in a String III
    func reverseWords(_ s: String) -> String {
        let arr = s.split(separator: " ")
        return arr.map {String(Array($0).reversed())} .joined(separator: " ")
    }

// O(n), O(n)
class Solution {
    func reverseWords(_ s: String) -> String {
        let arr = s.split(separator: " ").map { reversed(String($0)) }.joined(separator: " ")
        return arr
    }

    func reversed(_ w: String) -> String {
        var arr = Array(w)
        var l = 0, r = arr.endIndex-1
        while l<r {
            (arr[l], arr[r]) = (arr[r], arr[l])
            l += 1
            r -= 1
        }
        return String(arr)
    }
}