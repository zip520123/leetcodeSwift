//Generalized Abbreviation
//O(n2^n) O(n)
    func generateAbbreviations(_ word: String) -> [String] {
        var res = [String]()
        let wArr = Array(word)
        func dfs(_ path: String, _ k: Int, _ i: Int) {
            if i == wArr.endIndex {
                if k != 0 {
                    res.append(path+String(k))
                } else {
                    res.append(path)
                }
                return
            }
            dfs(path, k+1, i+1)
            
            if k > 0 {
                dfs(path+String(k)+String(wArr[i]), 0, i+1)
            } else {
                dfs(path+String(wArr[i]), 0, i+1)
            }
        }
        dfs("", 0,0)
        return res
    }