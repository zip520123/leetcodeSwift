// Convert an Array Into a 2D Array With Conditions
// O(n), O(n)
func findMatrix(_ nums: [Int]) -> [[Int]] {
    var dict = [Int: Int]()
    for n in nums {
        dict[n, default: 0] += 1
    }
    var res = [[Int]]()
    for (key, val) in dict {
        for row in 0..<val {
            if res.endIndex == row {
                res.append([])
            }
            res[row].append(key)
        }
    }
    return res
}