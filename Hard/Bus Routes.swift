// Bus Routes
// O(n), O(n)
func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
    if source == target {return 0}
    var graph = [Int: [Int]]()
    for i in 0..<routes.endIndex {
        for stop in routes[i] {
            graph[stop, default: []].append(i)
        }
    }

    var queue = [Int]()
    var seen = Set<Int>()
    for route in graph[source]! {
        queue.append(route)
        seen.insert(route)
    }
    var busCount = 1
    while !queue.isEmpty {
        let temp = queue
        queue = []
        for route in temp {
            for stop in routes[route] {
                if stop == target {return busCount}
                for nextRoute in graph[stop]! {
                    if seen.contains(nextRoute) == false {
                        seen.insert(nextRoute)
                        queue.append(nextRoute)
                    }
                }
            }
            
        }
        busCount += 1
    }
    return -1
}