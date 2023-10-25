// K-th Symbol in Grammar
// O(n), O(n)
func kthGrammar(_ n: Int, _ k: Int) -> Int {
    func dfs(_ n: Int, _ k: Int, _ rootVal: Int) -> Int {
        if n == 1 {return rootVal}
        let totalNodes = Int(pow(2, Double(n-1)))
        if k > totalNodes / 2 {
            let nextRootVal = rootVal == 0 ? 1 : 0
            return dfs(n-1, k-(totalNodes/2), nextRootVal)
        } else {
            let nextRootVal = rootVal == 0 ? 0 : 1
            return dfs(n-1, k, nextRootVal)
        }
    }

    return dfs(n,k,0)
}