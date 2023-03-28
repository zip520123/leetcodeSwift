//Minimum Cost For Tickets
//O(n), O(n)
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: 0, count: days.endIndex), count: 3)
        dp[0][0] = costs[0]
        var i = 0, day = days[0]
        while i < days.endIndex && days[i] <= day+7-1 {
            dp[1][i] = costs[1]
            i += 1
        }
        i = 0; day = days[0]
        while i<days.endIndex && days[i] <= day+30-1 {
            dp[2][i] = costs[2]
            i += 1
        }

        i = 1
        while i<days.endIndex {
            if dp[0][i] == 0 {
                dp[0][i] = min(dp[0][i-1],dp[1][i-1],dp[2][i-1]) + costs[0]
            }

            if dp[1][i] == 0 {
               let prev = days[i]-7
               for j in (i-7)..<i where j >= 0 {
                   if days[j] <= prev {
                       dp[1][i] = min(dp[0][j],dp[1][j],dp[2][j]) + costs[1]
                   }
               }
            }

            if dp[2][i] == 0 {
               let prev = days[i]-30
               for j in (i-30)..<i where j >= 0 {
                   if days[j] <= prev {
                       dp[2][i] = min(dp[0][j],dp[1][j],dp[2][j]) + costs[2]
                   }
               }
            }
            i += 1
        }
        let n = days.endIndex-1
        return min(dp[0][n], dp[1][n], dp[2][n])
    }