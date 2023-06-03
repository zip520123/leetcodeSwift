// Detonate the Maximum Bombs
//O(n^2), O(n^2)
    func maximumDetonation(_ bombs: [[Int]]) -> Int {
        var dict = [Int:[Int]]()
        
        for i in 0..<bombs.endIndex-1 {
            let x1 = Double(bombs[i][0]), y1 = Double(bombs[i][1]), r1 = bombs[i][2]
            for j in i+1..<bombs.endIndex {
                let x2 = Double(bombs[j][0]), y2 = Double(bombs[j][1]), r2 = bombs[j][2]
                let d = sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2))
                if d <= Double(r1)  {
                    dict[i, default:[]].append(j)
                }
                if d <= Double(r2) {
                    dict[j, default:[]].append(i)
                }
            }
        }
        
        var res = 0
        for i in 0..<bombs.endIndex {
            var queue = [i]
            var curr = 0
            var seen = Set<Int>()
            seen.insert(i)
            while !queue.isEmpty {
                let temp = queue
                queue.removeAll()
                for node in temp {
                    curr += 1
                    for next in dict[node, default:[]] {
                        if seen.contains(next) == false {
                            seen.insert(next)
                            queue.append(next)
                        }
                    }
                }
            }
            res = max(res, curr)
        }
        return res
    }