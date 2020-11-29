/*Combination Sum*/
//time O(n!) space O(n)
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var res = [[Int]]()
    let count = candidates.count
    func dfs(_ curr: Int,_ list: [Int],_ index: Int) {
        if curr == 0 { 
            res.append(list)
            return
        }
        var list = list
        for i in index..<count {
            let n = candidates[i]
            let rest = curr - n
            if rest >= 0 {
                list.append(n)
                dfs(rest, list, i)
                list.removeLast()
            }
        }
    }
    dfs(target, [], 0)
    return res
}

