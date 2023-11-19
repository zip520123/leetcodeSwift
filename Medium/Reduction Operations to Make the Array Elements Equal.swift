// Reduction Operations to Make the Array Elements Equal
// O(n log n), O(n)
func reductionOperations(_ nums: [Int]) -> Int {
    let arr = nums.sorted(by: >)
    var res = 0
    var count = 0
    for i in 0..<arr.endIndex {
        if i == 0 || arr[i] != arr[i-1] {
            res += count
        }
        count += 1
    } 
    return res
}