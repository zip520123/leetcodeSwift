// Time Needed to Inform All Employees
//O(n), O(n)
    func numOfMinutes(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
        var dict = [Int: [Int]]()
        for (i,m) in manager.enumerated() {
            dict[m, default:[]].append(i)
        }
        
        func dfs(_ node: Int) -> Int {
            let t = informTime[node]
            var subTime = 0
            for subNode in dict[node, default:[]] {
                subTime = max(subTime, dfs(subNode))
            }
            return subTime + t
        }
        return dfs(headID)
    }