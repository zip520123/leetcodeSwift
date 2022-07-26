//Smallest String With Swaps
//O(n log n), O(n)
func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {
    var res = [Character?](repeating: nil, count: s.count)
    var graph = [Int: [Int]]()
    for pair in pairs {
        graph[pair[0], default:[]].append(pair[1])
        graph[pair[1], default:[]].append(pair[0])
    }
    let arr = Array(s)
    for i in 0..<res.endIndex {
        if res[i] == nil {
            var queue = [i]
            var set = Set<Int>([i])
            while !queue.isEmpty {
                let curr = queue.removeFirst()
                for next in graph[curr, default: []] {
                    if set.contains(next) == false {
                        set.insert(next)
                        queue.append(next)
                    }
                }
            }
            let sortedChar = Array(set).map{arr[$0]}.sorted { a,b in a<b }
            let sortedIndex = Array(set).sorted {a,b in a<b}
            var j = 0
            for i in sortedIndex {
                res[i] = sortedChar[j]
                j += 1
            }
            
        }
    }
    
    return res.map{ String($0!) }.joined()
}

let a =  "dcaba", b = [[0,3],[1,2]]
print(smallestStringWithSwaps(a,b))