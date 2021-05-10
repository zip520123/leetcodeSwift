//Paint House II
//O(nk), O(k), n = costs.len, k = cost.len
    func minCostII(_ costs: [[Int]]) -> Int {
        var len = costs[0].endIndex
        var prev = costs[0]
        for i in 1..<costs.endIndex {
            let curr = costs[i]
            var table1 = (0..<len).map{_ in 0}
            table1[len-1] = Int.max
            var j = len-2
            while j >= 0 {
                table1[j] = min(table1[j+1],prev[j+1])
                j -= 1
            }
            var table2 = (0..<len).map{_ in 0}
            table2[0] = Int.max
            for j in 1..<len {
                table2[j] = min(table2[j-1], prev[j-1])
            }
            for j in 0..<len {
                prev[j] = curr[j]+min(table1[j],table2[j])
            }
        }
        return prev.min()!
    }
/*
[[1,5,3],[2,9,4]]
[1,5,3], [2+min(5,3), 9+min(1,3), 4+min(1,5)]
[1,5,3], [5,10,5]

[1,5,3]
 3 3 x  <- table1, min number at right 
 x 1 1  <- table2, min number at left
 
[2, 9,4]
 5,10,5 <- cost[i]+ min(table1[i], table2[i])
*/