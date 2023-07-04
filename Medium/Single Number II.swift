// Single Number II
// O(n), O(n)
func singleNumber(_ nums: [Int]) -> Int {
    var dict = [Int: Int]()
    for n in nums {
        dict[n, default: 0] += 1
    }
    for (key, val) in dict {
        if val == 1 {
            return key
        }
    }
    return 0
}