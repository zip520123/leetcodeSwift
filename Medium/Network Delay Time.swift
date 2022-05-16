//Network Delay Time
//DFS O((n-1)! + E), O(n+E)
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        
        var dict = [Int: [(node: Int, time: Int)]]()
        for time in times {
            let source = time[0], dist = time[1], wei = time[2]
            dict[source, default:[]].append((dist, wei))
        }
        
        var signalReceived = (0...n).map {_ in Int.max}
        
        func dfs(_ curr: Int, _ time: Int) {
            if time >= signalReceived[curr] {return}
            signalReceived[curr] = time
            for (node, travelTime) in dict[curr, default:[]] {
                dfs(node, time + travelTime)    
            }
        }
        
        dfs(k, 0)
        var res = Int.min
        for node in 1...n {
            res = max(res, signalReceived[node])
        }
        return res == Int.max ? -1 : res
    }

//BFS O(n*E), O(n*E)
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var arr = (0...n).map {_ in Int.max}
        var graph = [Int:[(Int, Int)]]()
        for t in times {
            let source = t[0], dest = t[1], time = t[2]
            graph[source, default: []].append((dest, time))
        }
        
        var queue = [k]
        arr[k] = 0
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            for (next, time) in graph[curr, default: []] {
                let travelTime = arr[curr] + time
                if arr[next] > travelTime {
                    arr[next] = travelTime
                    queue.append(next)
                }
            }
        }
        var res = Int.min
        for node in 1...n {
            res = max(res, arr[node])
        }
        return res == Int.max ? -1 : res
    }