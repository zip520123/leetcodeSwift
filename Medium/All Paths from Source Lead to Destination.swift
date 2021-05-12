//All Paths from Source Lead to Destination
//O(V+E), O(V+E)
    func leadsToDestination(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var graph = [Int:[Int]]()
        for edge in edges {
            graph[edge[0], default:[]].append(edge[1])
        }
        
        let status = (0..<n).map{_ in 0}
        //status: 0 hasn't seen, 1 processing, 2 seen
        
        func dfs(_ node: Int, _ status: [Int]) -> Bool {
            var status = status
            
            switch status[node] {
                case 1: //detect cycle
                    return false
                case 2: //seen "cross-edge"
                    return true
                default:
                    break
            }
            
            let neighbors = graph[node, default:[]]
            if neighbors.endIndex == 0 {
                return node == destination
            }
            
            status[node] = 1
            for nei in neighbors {
                if dfs(nei, status) == false {
                    return false
                }
            }
            status[node] = 2
            return true
        }
        return dfs(source, status)
    }