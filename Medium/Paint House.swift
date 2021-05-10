//Paint House
/*
[[17, 2, 17], [16,16,5],[14,3,19]]
red, blue, green
[17,2,17],[16+min(2,17),16+min(17,17),5+min(17,2)],[]
[17,2,17],[18,33,7],[14+min(33,7),3+min(18,7),19+min(18,33)]
*/
//O(n), O(n), n = costs.len
class Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        var dp = [[Int]]()
        dp.append(costs[0])
        for i in 1..<costs.endIndex {
            let curr = costs[i]
            let prev = dp[i-1]
            let n1 = curr[0] + min(prev[1], prev[2])
            let n2 = curr[1] + min(prev[0], prev[2])
            let n3 = curr[2] + min(prev[0], prev[1])
            dp.append([n1,n2,n3])
        }
        return dp.last!.min()!
    }
}

//O(n), O(1), m = costs.len
class Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        var dp = costs[0]
        for i in 1..<costs.endIndex {
            let curr = costs[i]
            let prev = dp
            let n1 = curr[0] + min(prev[1], prev[2])
            let n2 = curr[1] + min(prev[0], prev[2])
            let n3 = curr[2] + min(prev[0], prev[1])
            dp = [n1,n2,n3]
        }
        return dp.min()!
    }
}