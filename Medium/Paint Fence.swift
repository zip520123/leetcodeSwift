// Paint Fence
// O(n), O(n)
class Solution {
    func numWays(_ n: Int, _ k: Int) -> Int {
        if n == 0 { return 0 }
        if n == 1 { return k }
        if n == 2 { return k*k }
        var dp = [Int](repeating: 0, count: n+1)
        dp[1] = k
        dp[2] = k*k
        for i in 3...n {
            dp[i] = (dp[i-1] + dp[i-2]) * (k-1)
        }
        return dp[n]
    }
}

/*
numWays(i) = diff(i) + same(i)
diff(i) = numWays(i-1) * (k-1)
same(i) = diff(i-1) * 1

numWays(i) = (numWays(i-1) + numWays(i-2)) * (k-1)

*/