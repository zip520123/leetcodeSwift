// Unique Length-3 Palindromic Subsequences
// O(n^3), O(n^3), TLE
func countPalindromicSubsequence(_ s: String) -> Int {
    let arr = Array(s)
    var set = Set<String>()
    for i in 0..<arr.endIndex-2 {
        for j in i+1..<arr.endIndex-1 {
            for k in j+1..<arr.endIndex {
                if arr[i] == arr[k] {
                    let word = String(arr[i]) + String(arr[j]) + String(arr[k])
                    set.insert(word)
                }
            }
        }
    }
    return set.count
}

// O(n), O(1)
func countPalindromicSubsequence(_ s: String) -> Int {
    let arr = Array(s)
    var chars = Set(arr)
    var res = 0
    for char in chars {
        var l = -1, r = 0
        for i in 0..<arr.endIndex {
            if arr[i] == char {
                if l == -1 {
                    l = i
                }
                r = i
            }
        }
        var set = Set<Character>()
        if l+1 > r {continue}
        for i in l+1..<r {
            set.insert(arr[i])
        }
        res += set.count
    }
    return res
}