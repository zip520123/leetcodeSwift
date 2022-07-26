//Two City Scheduling
//O(n log n), O(n)
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        var loses = [Int](), cost = 0
        for person in costs {
            let a = person[0], b = person[1]
            loses.append(b-a)
            cost += a
        }
        loses.sort()
        let n = costs.endIndex/2
        for i in 0..<n {
            cost += loses[i]
        }
        return cost
    }