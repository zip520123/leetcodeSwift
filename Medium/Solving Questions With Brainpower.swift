//Solving Questions With Brainpower
//O(n), O(n)
    func mostPoints(_ questions: [[Int]]) -> Int {
        var dp = questions.map {_ in 0}
        let len = questions.endIndex
        dp[len-1] = questions[len-1][0]
        for i in (0..<len-1).reversed() {
            let points = questions[i][0], brainPower = questions[i][1]
            dp[i] = points
            if i+brainPower+1 < len {
                dp[i] += dp[i+brainPower+1]
            } 
            dp[i] = max(dp[i], dp[i+1])
        }
        return dp[0]
    }