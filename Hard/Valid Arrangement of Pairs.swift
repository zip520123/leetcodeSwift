// Valid Arrangement of Pairs
// O(n), O(n)
func validArrangement(_ pairs: [[Int]]) -> [[Int]] {
    var graph = [Int: [Int]]()
    var in_count = [Int: Int](), out_count = [Int: Int]()
    for p in pairs {
        let a = p[0], b = p[1]
        graph[a, default:[]].append(b)
        in_count[a, default: 0] += 1
        out_count[b, default: 0] += 1
    }
    
    var start = -1
    for (node, val) in in_count {
        if out_count[node, default: 0] < val {
            start = node
            break
        }
    }
    if start == -1 {
        start = pairs[0][0]
    }

    var arr = [Int]()
    func dfs(_ node: Int) {
        while graph[node, default: []].last != nil {
            let next_node = graph[node]!.removeLast()
            dfs(next_node)
        }
        arr.append(node)
    }
    dfs(start)
    let reversed_arr = Array(arr.reversed())
    var res = [[Int]]()
    for i in 1..<reversed_arr.endIndex {
        res.append([reversed_arr[i-1], reversed_arr[i]])
    }
    return res
}

// 
func validArrangement(_ pairs: [[Int]]) -> [[Int]] {
    var graph = [Int: [Int]]()
    var out_count = [Int: Int]()
    for p in pairs {
        let a = p[0], b = p[1]
        graph[a, default:[]].append(b)
        out_count[b, default: 0] += 1
    }
    
    var start = pairs[0][0]
    for (node, arr) in graph {
        if arr.endIndex > out_count[node, default: 0] {
            start = node
            break
        }
    }
    
    var arr = [Int]()
    func dfs(_ node: Int) {
        while let next_node = graph[node]?.popLast() {
            dfs(next_node)
        }
        arr.append(node)
    }
    dfs(start)
    let reversed_arr = Array(arr.reversed())
    var res = [[Int]]()
    for i in 1..<reversed_arr.endIndex {
        res.append([reversed_arr[i-1], reversed_arr[i]])
    }
    return res
}