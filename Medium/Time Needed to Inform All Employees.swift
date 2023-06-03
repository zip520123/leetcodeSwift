// Time Needed to Inform All Employees
//DFS O(n), O(n)
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

//BFS O(n), O(n)
    func numOfMinutes(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
        var dict = [Int: [Int]]()
        for (i,m) in manager.enumerated() {
            dict[m, default:[]].append(i)
        }
        
        var queue: [(Int, Int)] = [(headID, 0)]
        var res = 0
        while !queue.isEmpty {
            let (node, t) = queue.removeFirst()
            res = max(res, t)
            for subNode in dict[node, default: []] {
                queue.append((subNode, t+informTime[node]))
            }
        }
        return res
    }