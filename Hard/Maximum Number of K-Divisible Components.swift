// Maximum Number of K-Divisible Components
// O(n), O(n)
func maxKDivisibleComponents(_ n: Int, _ edges: [[Int]], _ values: [Int], _ k: Int) -> Int {
    var graph = [Int: [Int]]()
    for edge in edges {
        let a = edge[0], b = edge[1]
        graph[a, default: []].append(b)
        graph[b, default: []].append(a)
    }
    var res = 0
    var seen = Set<Int>()
    func dfs(_ node: Int) -> Int {
        if seen.contains(node) {
            return 0
        }
        seen.insert(node)
        var sub_node_sum = 0
        for sub_node in graph[node, default:[]] {
            sub_node_sum += dfs(sub_node)
        }
        if (sub_node_sum + values[node]) % k == 0 {
            res += 1
        }
        return sub_node_sum + values[node]
    }
    dfs(0)
    return res
}