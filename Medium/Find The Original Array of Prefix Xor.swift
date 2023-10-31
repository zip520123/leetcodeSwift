// Find The Original Array of Prefix Xor
// O(n), O(1)
func findArray(_ pref: [Int]) -> [Int] {
    var res = [pref[0]]
    for i in 1..<pref.endIndex {
        res.append(pref[i-1]^pref[i])
    }
    return res
}