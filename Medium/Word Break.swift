/*Word Break*/
//O(s.length^3) O(s.length)
func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var dict = [String:Bool]()
    func dfs(_ s: String) -> Bool {
        if dict[s] != nil {return dict[s]!}
        if s == "" {return true}
        let sArr = Array(s)
        var res = false
        for word in wordDict {
            let wArr = Array(word)
            var i = 0
            while i < sArr.endIndex && i < wArr.endIndex && sArr[i] == wArr[i]{
                i += 1
            }
            if i == wArr.endIndex {
                res = res || dfs(String(sArr[i...]))
            }
        }
        dict[s] = res
        return res
    }
    
    return dfs(s)
}