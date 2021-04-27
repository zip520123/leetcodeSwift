//Critical Connections in a Network
//O(V+E) O(V+E)
    func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
        var graph = [Int:[Int]]()
        var nodesRank = [Int:Int]()
        var connSet = Set<[Int]>()
        for edge in connections {
            let p1 = edge[0], p2 = edge[1]
            graph[p1,default:[]].append(p2)
            graph[p2,default:[]].append(p1)
            let sortedP1 = min(p1,p2), sortedP2 = max(p1,p2)
            connSet.insert([sortedP1,sortedP2])
        }
        
        func dfs(_ node: Int, _ currRank: Int) -> Int {
            if let rank = nodesRank[node] {return rank}
            nodesRank[node] = currRank
            var minRank = currRank
            for neighbor in graph[node]! {
                if let parent = nodesRank[neighbor], parent + 1 == currRank { continue }
                let recurRank = dfs(neighbor, currRank + 1)
                if recurRank <= currRank {
                    let sortedP1 = min(node, neighbor), sortedP2 = max(node, neighbor)
                    connSet.remove([sortedP1, sortedP2])
                }
                minRank = min(recurRank, minRank)
            }
            return minRank
        }
        
        dfs(0,0)
        
        return Array(connSet)
    }