//Build an Array With Stack Operations
//O(n), O(n)
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

// O(n), O(n)
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        var res = [String]()
        var index = 0
        for curr in 1...n {
            if target[index] == curr {
                index += 1
                res.append("Push")
                if index == target.endIndex {return res}
            } else {
                res.append("Push")
                res.append("Pop")
            }
        }
        return res
    }