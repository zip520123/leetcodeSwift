//Minimum Number of Vertices to Reach All Nodes
//O(n+e), O(n)
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var isIncommingNode = (0..<n).map {_ in false}
        for edge in edges {
            isIncommingNode[edge[1]] = true
        }
        var res = [Int]()
        for i in 0..<n {
            if isIncommingNode[i] == false {
                res.append(i)
            }
        }
        return res
    }