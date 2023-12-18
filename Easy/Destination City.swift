// Destination City
// O(n), O(n)
func destCity(_ paths: [[String]]) -> String {
    var graph = [String: [String]]()
    for path in paths {
        let a = path[0], b = path[1]
        graph[a, default:[]].append(b)
    }
    var queue = [paths[0][0]]
    while !queue.isEmpty {
        let temp = queue
        queue = []
        for node in temp {
            if graph[node, default:[]].count == 0 {
                return node
            }
            for nextNode in graph[node]! {
                queue.append(nextNode)
            }
        }
    }
    return ""
}