//Build an Array With Stack Operations
//O(n)
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        var res = [String]()
        var j = 0, i = 1
        
        while i <= n && j < target.endIndex {
            res.append("Push")
            if target[j] != i {
                res.append("Pop")
            } else {
                j += 1
            }
            i+=1
        }
        return res
    }