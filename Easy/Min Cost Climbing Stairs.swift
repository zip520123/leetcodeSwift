//Min Cost Climbing Stairs
//dp 
func minCostClimbingStairs(_ cost: [Int]) -> Int {
    var dp = [0,0]
    for i in 2...cost.endIndex {
        dp.append(min(dp[i-1]+cost[i-1],dp[i-2]+cost[i-2]))
    }
    return dp[dp.endIndex - 1]
}

func minCostClimbingStairs(_ cost: [Int]) -> Int {
    var dp = (0...cost.endIndex).map {_ in 0}
    var i = 2
    while i < dp.endIndex {
        dp[i] = min(dp[i-2]+cost[i-2],dp[i-1]+cost[i-1])
        i += 1
    }
    return dp.last!
}

//O(n), O(n)
func minCostClimbingStairs(_ cost: [Int]) -> Int {
    var arr = cost
    for i in 2..<arr.endIndex {
        arr[i] += min(arr[i-1],arr[i-2])
    }
    return min(arr[arr.endIndex-1], arr[arr.endIndex-2])
}

//O(n), O(n) Jump Game VI, queue
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp = [0] + cost + [0]
        var queue = [0]
        for i in 1..<dp.endIndex {
            let curr = dp[queue.first!] + dp[i]
            dp[i] = curr
            while !queue.isEmpty && dp[queue.last!] > curr {
                queue.removeLast()
            }
            queue.append(i)
            if queue.first! == i-2 {
                queue.removeFirst()
            }
        }
        return dp.last!
    }