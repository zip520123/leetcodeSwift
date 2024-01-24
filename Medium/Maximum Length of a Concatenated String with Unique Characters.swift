//Maximum Length of a Concatenated String with Unique Characters
//O(2^n), O(n!)
    func maxLength(_ arr: [String]) -> Int {
        var dp = [Set<Character>()]
        for s in arr {
            if Set(s).count < s.count {continue}
            let set = Set(s)
            for c in dp {
                if !set.isDisjoint(with: c) {continue}
                dp.append(set.union(c))
            }
        }
        
        return dp.map { $0.count }.max()!
    }

    func maxLength(_ arr: [String]) -> Int {
        var res = 0
        func dfs(_ path: Set<Character>, _ index: Int) {
            res = max(res, path.count)
            if index == arr.endIndex {return}
            for i in index..<arr.endIndex {
                let currSet = Set(arr[i])
                if currSet.count < arr[i].count {continue}
                if currSet.isDisjoint(with: path) {
                    dfs(currSet.union(path), i+1)
                }
            }
        }
        dfs(Set(), 0)
        return res
    }