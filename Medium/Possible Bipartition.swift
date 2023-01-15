//Possible Bipartition
    func possibleBipartition(_ N: Int, _ dislikes: [[Int]]) -> Bool {
        var edges = [[Int]](repeating: [Int](), count: N+1)
        for dislike in dislikes {
            edges[dislike[0]].append(dislike[1])
            edges[dislike[1]].append(dislike[0])
        }

        var color = [Int](repeating: -1, count: N+1)
        for p in 1...N {
            if color[p] == -1 {
                color[p] = 1
                var queue = [p]
                while queue.isEmpty == false {
                    let curr = queue.removeFirst()
                    let currColor = color[curr]
                    for adjacent in edges[curr] {
                        if color[adjacent] == -1 {
                            color[adjacent] = currColor ^ 1
                            queue.append(adjacent)
                        } else if color[adjacent] != currColor ^ 1 {
                            return false
                        }
                    }
                }
            }
        }
        return true
    }

//O(n), O(n)
    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        var dict = [Int: [Int]]()
        
        for dislike in dislikes {
            let a = dislike[0], b = dislike[1]
            dict[a, default:[]].append(b)
            dict[b, default:[]].append(a)
        }
        
        var status = [Int: Int]()

        for p in 1...n {
            if status[p] == nil {
                status[p] = 1
                var queue = [p]
                while !queue.isEmpty {
                    let node = queue.removeFirst()
                    
                    for next in dict[node, default:[]] {
                        if status[next] == nil {
                            if status[node] == 1 {
                                status[next] = 2
                            } else {
                                status[next] = 1
                            }
                            queue.append(next)
                        } else if (status[next] == 1 && status[node] == 1) || 
                               (status[next] == 2 && status[node] == 2) {
                            return false
                        }
                    }
                    
                }
            }
            
        }
        
        return true
    }
