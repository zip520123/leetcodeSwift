// Maximum Number of Achievable Transfer Requests
//O(n^requests.len), O(requests.len+n)
func maximumRequests(_ n: Int, _ requests: [[Int]]) -> Int {
    var buildings = (0..<n).map { _ in 0 }

    func dfs(_ index: Int, _ count: Int) -> Int {
        if index == requests.endIndex {
            for num in buildings {
                if num != 0 {
                    return 0
                }
            }
            return count
        }
        var res = 0
        let request = requests[index]
        buildings[request[0]] -= 1
        buildings[request[1]] += 1
        res = max(res, dfs(index+1, count+1))
        buildings[request[0]] += 1
        buildings[request[1]] -= 1
        res = max(res, dfs(index+1, count))
        return res
    }

    return dfs(0,0)
}