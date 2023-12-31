// Largest Substring Between Two Equal Characters
// O(n^2), O(n)
func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
    let arr = Array(s)
    var res = -1
    for i in 0..<arr.endIndex-1 {
        for j in (i+1)..<arr.endIndex {
            if arr[i] == arr[j] {
                res = max(res, j-(i+1))
            }
        }
    }
    return res
}

// O(n), O(n)
func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
    let arr = Array(s)
    var res = -1
    var memo = [Character: Int]()
    for (i, char) in arr.enumerated() {
        memo[char] = i
    }
    for i in 0..<arr.endIndex {
        let char = arr[i]
        res = max(res, memo[char]! - (i+1) )
    }
    return res
}