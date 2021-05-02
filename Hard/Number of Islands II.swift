//Number of Islands II
//O(mn+l) O(mn)
    func numIslands2(_ m: Int, _ n: Int, _ positions: [[Int]]) -> [Int] {
        var arr = (0..<m*n).map {_ in -1}
        var count = 0
        func find(_ p: Int) -> Int { //O(n)
            if arr[p] == p {return arr[p]}
            arr[p] = find(arr[p])
            return arr[p]
        }
        
        func union(_ p1: Int, _ p2: Int) { //O(n)
            let root1 = find(p1)
            let root2 = find(p2)
            if root1 != root2 {
                count -= 1
                arr[root1] = root2
            }
        }
        
        var res = [Int]()
        let direction = [(0,1),(1,0),(0,-1),(-1,0)]
        for position in positions {
            let x = position[0], y = position[1]
            let p = x*n + y
            if arr[p] == -1 {
                arr[p] = p
                count += 1
                for (dx, dy) in direction {
                    let p2x = x+dx, p2y = y+dy
                    if p2x >= 0 && p2x < m && p2y >= 0 && p2y < n {
                        let p2 = p2x*n + p2y
                        if arr[p2] != -1 {
                            union(p,p2)
                        }
                    }
                }
            }
            res.append(count)
        }
        
        return res
    }