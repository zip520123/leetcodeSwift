// Reverse Prefix of Word
// O(n), O(n)
func reversePrefix(_ word: String, _ ch: Character) -> String {
    var arr = Array(word)
    for i in 0..<arr.endIndex {
        if arr[i] == ch {
            var l = 0, r = i
            while l<r {
                (arr[l], arr[r]) = (arr[r], arr[l])
                l += 1
                r -= 1
            }
            return String(arr)
        }
    }
    return word
}