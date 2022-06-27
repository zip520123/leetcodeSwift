//Partitioning Into Minimum Number Of Deci-Binary Numbers
//O(n), O(1)
    func minPartitions(_ n: String) -> Int {
        var res = 0
        for char in n {
            let curr = Int(String(char))!
            res = max(res, curr)
        }
        return res
    }