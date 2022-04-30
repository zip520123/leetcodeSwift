//Evaluate Division
//O(n), O(2n)
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var wei = [String: Double](), graph = [String: Set<String>](), chars = Set<String>()
        for i in 0..<equations.endIndex {
            let equation = equations[i] 
            let a = equation[0], b = equation[1]
            chars.insert(a)
            chars.insert(b)
            wei["\(a)->\(b)"] = values[i]
            graph[a, default:[]].insert(b)
            wei["\(b)->\(a)"] = 1 / values[i]
            graph[b, default:[]].insert(a)
        }
        
        var res = [Double]()
        
        nextQuery: for query in queries {
            let start = query[0], end = query[1]
            if start == end && chars.contains(start) {
                res.append(1)
                continue nextQuery
            }
            var queue: [(String, Double)] = [(start,1)]
            var seen: Set<String> = [start]
            while !queue.isEmpty {
                let (a, prevWei) = queue.removeFirst()
                for next in graph[a, default: []] where seen.contains(next) == false {
                    let currWei = wei["\(a)->\(next)"]! * prevWei

                    seen.insert(next)
                    if next == end {
                        res.append(currWei)
                        continue nextQuery
                    }
                    queue.append((next, currWei))
                }
            }
            res.append(-1)
        }
        return res
    }