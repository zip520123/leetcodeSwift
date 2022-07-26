/* Longest Substring Without Repeating Characters*/
//O(n), O(n)
func lengthOfLongestSubstring(_ s: String) -> Int {
    var res = 0
    let arr = Array(s)
    var l = 0, r = 0
    var dict = [Character: Int]()
    while r<arr.endIndex {
        let char = arr[r]
        dict[char, default:0] += 1
        while dict[char]! > 1 {
            let leftChar = arr[l] 
            dict[leftChar]! -= 1
            l += 1
        }
        res = max(res, r-l+1)
        r += 1
    }
    return res
}