//Cheapest Flights Within K Stops
//O(citys + flights * k), O(citys + flights)
    func findCheapestPrice(_ n:Int , _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var dict = [Int: [Int: Int]]()
        for flight in flights {
            dict[flight[0], default:[:]][flight[1]] = flight[2]
        }
        var minCost = (0..<n).map {_ in Int.max}
        var queue: [(curr: Int, cost: Int)] = [(src, 0)]

        for _ in 0...k {
            let temp = queue
            queue.removeAll()
            for status in temp {
                for (next, cost) in Array(dict[status.curr, default:[:]]) {
                    if minCost[next] > status.cost + cost {
                        minCost[next] = status.cost + cost
                        queue.append((next, cost+status.cost))
                    }
                }
                
            }
        }

        return minCost[dst] == Int.max ? -1 : minCost[dst]
    }