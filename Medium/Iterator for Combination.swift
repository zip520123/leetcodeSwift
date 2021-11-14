//Iterator for Combination
//O(n!), O(n!)
class CombinationIterator {
    var res = [String]()
    var i = 0
    init(_ characters: String, _ combinationLength: Int) {
        res = combination(characters, combinationLength)
    }
    
    func next() -> String {
        let s = res[i]
        i += 1
        return s
    }
    
    func hasNext() -> Bool {
        i < res.count
    }
    
    func combination(_ s: String, _ len: Int) -> [String] {
        var arr = Array(s), res = [String]()
        func dfs(_ path: String, _ index: Int) {
            if path.count == len {
                res.append(path)
                return
            }
            for i in index..<arr.endIndex {
                dfs(path+String(arr[i]), i+1)
            }
        }
        dfs("", 0)
        return res
    }
}