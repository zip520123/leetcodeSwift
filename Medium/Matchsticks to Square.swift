//Matchsticks to Square
//O(4^n), O(n)
    func makesquare(_ matchsticks: [Int]) -> Bool {
        
        var count = matchsticks.reduce(0,+) / 4
        let matchsticks = matchsticks.sorted(by: >)
        func dfs(_ i: Int, _ l:Int, _ r: Int, _ t: Int, _ b: Int) -> Bool {
            if i == matchsticks.endIndex {
                return l == r && r == t && t == b
            }
            let curr = matchsticks[i]
            if l+curr <= count {
                if dfs(i+1, l+curr, r, t, b) {
                    return true
                }
            }
            if r+curr <= count {
                if dfs(i+1, l, r+curr, t, b) {
                    return true
                }
            }
            if t+curr <= count {
                if dfs(i+1, l, r, t+curr, b)  {
                    return true
                }
            }
            if b+curr <= count {
                if dfs(i+1, l, r, t, b+curr)  {
                    return true
                }
            }
            return false
            
        }
        return dfs(0,0,0,0,0)
    }