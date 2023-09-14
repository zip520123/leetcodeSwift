// Reconstruct Itinerary
// O(n log n), O(n)
func findItinerary(_ tickets: [[String]]) -> [String] {
    var graph = [String: [String]]()
    let arr = tickets.sorted { a,b in 
        return a[1] > b[1]
    }
    for item in arr {
        let src = item[0]
        let dst = item[1]
        graph[src, default: []].append(dst)
    }
    var res = [String]()
    func dfs(_ airport: String) {
        while graph[airport] != nil && !graph[airport]!.isEmpty {
            dfs(graph[airport]!.removeLast())
        }
        res.append(airport)
    }
    dfs("JFK")

    return res.reversed()
}