//Number of Operations to Make Network Connected
//O(n+e), O(n)
    func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
        var unitFind = [Int: Int]()
        for i in 0..<n {
            unitFind[i] = i
        }
        func find(_ node: Int) -> Int {
            if unitFind[node]! == node {return node}
            unitFind[node] = find(unitFind[node]!)
            return unitFind[node]!
        }

        var cable = 0
        for conn in connections {
            let a = conn[0], b = conn[1]
            if find(a) != find(b) {
                unitFind[find(a)] = find(b)
            } else {
                cable += 1
            }
        }

        var roots = Set<Int>()

        for i in 0..<n {
            let root = find(i)
            roots.insert(root)
        }
        let groups = roots.count
        if groups == 0 {return 0}
        if groups-1 > cable {return -1}

        return groups-1
    }