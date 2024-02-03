// Partition Array for Maximum Sum
// O(n), O(n)
func maxSumAfterPartitioning(_ arr: [Int], _ k: Int) -> Int {
    let n = arr.endIndex
    var dp = [Int](repeating: 0, count: n + 1)
    for i in 1...n {
        var currN = arr[i-1]
        for j in 1...k {
            if i-j >= 0 {
                currN = max(currN, arr[i-j])
                dp[i] = max(dp[i], dp[i-j] + currN*j)
            }
        }
    }
    return dp[n]
}