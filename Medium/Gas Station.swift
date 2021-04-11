//Gas Station
//O(n^2) O(1)
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        for i in 0..<gas.endIndex {
            var tank = 0
            var j = i
            while tank >= 0 {
                tank += gas[j]
                tank -= cost[j]
                j += 1
                if j == gas.endIndex {
                    j = 0
                }
                if j == i && tank >= 0 {
                    return i
                }
            }
        }
        return -1
    }
//O(n) O(1)
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var total = 0
        for i in 0..<gas.endIndex { //determine if we have a solution
            total += gas[i] - cost[i]
        }
        if total < 0 {
            return -1
        }
        var tank = 0
        var start = 0
        for i in 0..<gas.endIndex { // find out where to start
            tank += gas[i] - cost[i]
            if tank < 0 {
                start = i + 1
                tank = 0
            }
        }
        return start
    }