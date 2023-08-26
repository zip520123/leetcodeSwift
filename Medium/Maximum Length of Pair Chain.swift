// Maximum Length of Pair Chain
// O(n^2), O(n)
func findLongestChain(_ pairs: [[Int]]) -> Int {        
    let arr = pairs.sorted { a,b in a[0] < b[0] }
    var dict = [Int: Int]()
    let n = arr.endIndex
    func dfs(_ i: Int) -> Int {
        if dict[i] != nil {return dict[i]!}
        dict[i] = 1
        for j in i+1..<n {
            if arr[i][1] < arr[j][0] {
                dict[i] = max(dict[i]!, 1 + dfs(j))
            }
        }
        return dict[i]!
    }
    var res = 0
    for i in 0..<n {
        res = max(res, dfs(i))
    }
    return res
}

// O(n log n), O(1), greedy
func findLongestChain(_ pairs: [[Int]]) -> Int {        
    let arr = pairs.sorted { a,b in a[1] < b[1] }
    var res = 0
    var curr = Int.min
    for pair in arr {
        if curr < pair[0] {
            res += 1
            curr = pair[1]
        }
    }
    return res
}
