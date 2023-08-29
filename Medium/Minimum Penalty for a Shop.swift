// Minimum Penalty for a Shop
// O(n), O(1)
func bestClosingTime(_ customers: String) -> Int {
    let arr = Array(customers) + ["N"]
    var index = 0
    var p = 0
    for char in arr {
        if char == "Y" {
            p += 1
        }
    }
    var minP = p
    for i in 1..<arr.endIndex {
        if arr[i-1] == "Y" {
            p -= 1
        } else {
            p += 1
        }
        if minP > p {
            minP = p
            index = i
        }
    }
    return index
}