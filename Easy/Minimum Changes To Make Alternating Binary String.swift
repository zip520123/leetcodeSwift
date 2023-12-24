// Minimum Changes To Make Alternating Binary String
// O(n), O(n)
func minOperations(_ s: String) -> Int {
    let arr = Array(s)
    var mask1 = [Character]()
    for i in 0..<arr.endIndex {
        if i % 2 == 0 {mask1.append("0")}
        else {mask1.append("1")}
    }
    var mask2 = [Character]()
    for i in 0..<arr.endIndex {
        if i % 2 == 0 {mask2.append("1")}
        else {mask2.append("0")}
    }
    var res1 = 0
    for (char1, char2) in zip(arr, mask1) {
        if char1 != char2 {res1 += 1}
    }
    var res2 = 0
    for (char1, char2) in zip(arr, mask2) {
        if char1 != char2 {res2 += 1}
    }
    return min(res1, res2)
}