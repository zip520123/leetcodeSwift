//Stone Game IV
//O(n√n), O(√n)
    func winnerSquareGame(_ n: Int) -> Bool {
        var dict = [Int: Bool]()
        func dfs(_ r: Int) -> Bool {
            if r == 0 {return false}
            if r == 1 {return true}
            if dict[r] != nil {return dict[r]!}
            let sqrtRoot = Int(sqrt(Double(r)))
            for i in 1...sqrtRoot {
                if dfs(r - i*i) == false {
                    dict[r] = true
                    return true
                }
            }
            dict[r] = false
            return false
        }
        return dfs(n)
    }