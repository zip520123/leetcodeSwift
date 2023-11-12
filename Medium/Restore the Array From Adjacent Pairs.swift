// Restore the Array From Adjacent Pairs
// O(n), O(n), BFS
func restoreArray(_ adjacentPairs: [[Int]]) -> [Int] {
    var graph = [Int: [Int]]()
    for pair in adjacentPairs {
        graph[pair[0], default: []].append(pair[1])
        graph[pair[1], default: []].append(pair[0])
    }
    var root = 0
    for (key, val) in graph {
        if val.endIndex == 1 {
            root = key
            break
        }
    }
    
    var res = [Int]()
    var seen = Set<Int>()
    
    var queue = [root]
    while !queue.isEmpty {
        let node = queue.removeFirst()
        res.append(node)
        seen.insert(node)
        for next in graph[node]! {
            if seen.contains(next) == false {
                queue.append(next)
            }
        }
    }
    return res
}

// O(n), O(n), DFS
func restoreArray(_ adjacentPairs: [[Int]]) -> [Int] {
    var graph = [Int: [Int]]()
    for pair in adjacentPairs {
        graph[pair[0], default: []].append(pair[1])
        graph[pair[1], default: []].append(pair[0])
    }
    var root = 0
    for (key, val) in graph {
        if val.endIndex == 1 {
            root = key
            break
        }
    }
    
    var res = [Int]()
    func dfs(_ prev: Int?, _ node: Int) {
        res.append(node)
        for next in graph[node]! {
            if next != prev {
                dfs(node, next)
            }
        }
    }
    dfs(nil, root)
    return res
}