// Binary Subarrays With Sum
// O(n), O(n)
func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
    var memo = [Int: Int]()
    memo[0] = 1
    var res = 0
    var prefixSum = 0
    for n in nums {
        prefixSum += n
        res += memo[prefixSum - goal, default: 0]
        memo[prefixSum, default: 0] += 1
    }    
    return res
}