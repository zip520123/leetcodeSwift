//Stone Game VII
//O(n^2), O(n^2)
    func stoneGameVII(_ stones: [Int]) -> Int {
        let n = stones.endIndex
        var dp = (0..<n).map {_ in (0..<n).map{_ in 0} }
        var psum = [0] + stones
        for i in 1...n {
            psum[i] += psum[i-1]
        }
        func dfs(_ i: Int, _ j: Int) -> Int {
            if i == j {return 0}
            if dp[i][j] == 0 {
                let sum = psum[j+1] - psum[i]
                dp[i][j] = max(sum-stones[i] - dfs(i+1,j), sum-stones[j]-dfs(i,j-1))
            }
            return dp[i][j]
        }
        
        return dfs(0, n-1)
    }