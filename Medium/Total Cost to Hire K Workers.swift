// Total Cost to Hire K Workers
// O(costs.len*k), O(costs.len*k) MLE
    func totalCost(_ costs: [Int], _ k: Int, _ candidates: Int) -> Int {
        
        func dfs(_ costs: [Int], _ curr: Int, _ k: Int) -> Int {
            let n = costs.endIndex
            if k == 0 {
                return curr
            }
            var index = 0
            var cost = Int.max
            for i in 0..<candidates {
                if i < n && costs[i] < cost {
                    index = i
                    cost = costs[i]
                }
            }
            for i in (n-candidates)..<n {
                if i >= 0 && costs[i] < cost {
                    index = i
                    cost = costs[i]
                }
            }

            return dfs(Array(costs[0..<index]+costs[(index+1)...]), curr+cost, k-1)
        }

        return dfs(costs,0, k)
    }