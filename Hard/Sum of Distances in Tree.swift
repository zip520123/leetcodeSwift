//Sum of Distances in Tree
//O(n), O(n)
    func sumOfDistancesInTree(_ N: Int, _ edges: [[Int]]) -> [Int] {
        var graph = [Int: [Int]]()
        for edge in edges {
            graph[edge[0], default:[]].append(edge[1])
            graph[edge[1], default:[]].append(edge[0])
        }
        var count = (0..<N).map{_ in 1}
        var res = (0..<N).map{_ in 0}
        func dfs(_ node: Int = 0, _ parent: Int? = nil) {
            for child in graph[node, default:[]] {
                if child != parent {
                    dfs(child, node)
                    count[node] += count[child]
                    res[node] += res[child] + count[child]
                }
            }
        }
        func dfs2(_ node: Int = 0, _ parent: Int? = nil) {
            for child in graph[node, default:[]] {
                if child != parent {
                    res[child] = res[node] - count[child] + N - count[child]
                    dfs2(child, node)
                }
            }
        }
        dfs()
        dfs2()
        return res
    }