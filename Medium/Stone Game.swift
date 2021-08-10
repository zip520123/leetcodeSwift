//Stone Game
//O(1)
    func stoneGame(_ piles: [Int]) -> Bool {
        true
    }
//O(n^2)
    func stoneGame(_ piles: [Int]) -> Bool {
        var dp = (0..<piles.endIndex).map { _ in (0..<piles.endIndex).map{_ in 0}}
        for i in 0..<piles.endIndex {
            dp[i][i] = piles[i]
        }
        for d in 1..<piles.endIndex {
            for i in 0..<piles.endIndex-d {
                dp[i][i+d] = max(piles[i] - dp[i+1][i+d], piles[i+d]-dp[i][i+d-1])
            }
        }
        return dp[0].last! > 0
    }