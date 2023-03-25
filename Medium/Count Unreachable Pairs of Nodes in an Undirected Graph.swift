//Count Unreachable Pairs of Nodes in an Undirected Graph
//O(n), O(n)
    func countPairs(_ n: Int, _ edges: [[Int]]) -> Int {
        var dict = [Int: Int]()
        for i in 0..<n { 
            dict[i] = i
        }

        func find(_ node: Int) -> Int {
            if dict[node]! == node {return dict[node]!}
            dict[node] = find(dict[node]!)
            return dict[node]!
        }

        func unin(_ node1: Int, _ node2: Int) {
            let root1 = find(node1), root2 = find(node2)
            dict[root1] = root2
        }
        for edge in edges {
            let node1 = edge[0], node2 = edge[1]
            unin(node1, node2)
        }
        var rootToNode = [Int: [Int]]()
        for i in 0..<n {
            let root = find(i)
            rootToNode[root, default:[]].append(i)
        }
        var res = 0
        for i in 0..<n {
            let root = find(i)
            let arr = rootToNode[root]!
            res += n-arr.count
        }
        return res/2
    }