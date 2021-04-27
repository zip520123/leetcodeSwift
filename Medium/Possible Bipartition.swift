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