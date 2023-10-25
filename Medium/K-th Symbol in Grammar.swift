// K-th Symbol in Grammar
// O(n), O(n)
func kthGrammar(_ n: Int, _ k: Int) -> Int {
    func dfs(_ n: Int, _ k: Int, _ root: Int) -> Int {
        if n == 1 {return root}
        let totalNodes = Int(pow(2, Double(n-1)))
        if k > totalNodes / 2 {
            let nextRoot = root == 0 ? 1 : 0
            return dfs(n-1, k-totalNodes/2, nextRoot)
        } else {
            let nextRoot = root == 0 ? 0 : 1
            return dfs(n-1, k, nextRoot)
        }
    }
    return dfs(n,k,0)
}