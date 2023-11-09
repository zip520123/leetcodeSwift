// Count Number of Homogenous Substrings
// O(n), O(n)
func countHomogenous(_ s: String) -> Int {
    var res = 0
    var currCount = 0
    let arr = Array(s)
    for i in 0..<arr.endIndex {
        if i == 0 || arr[i] == arr[i-1] {
            currCount += 1
        } else {
            currCount = 1
        }
        res = (res + currCount) % Int(1E9+7)
    }
    return res
}