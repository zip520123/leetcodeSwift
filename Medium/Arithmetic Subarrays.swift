// Arithmetic Subarrays
// O(n log n * len(l)), O(n)
func checkArithmeticSubarrays(_ nums: [Int], _ l: [Int], _ r: [Int]) -> [Bool] {
    
    func isArithmetic(_ arr: [Int]) -> Bool {
        let arr = arr.sorted()
        let d = arr[0] - arr[1]
        for i in 1..<arr.endIndex {
            if arr[i-1] - arr[i] != d { return false}
        }
        return true
    }

    let n = l.endIndex
    var res = [Bool]()
    for i in 0..<n {
        let arr = Array(nums[l[i]...r[i]])
        res.append(isArithmetic(arr))
    }

    return res
}