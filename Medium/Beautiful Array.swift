//Beautiful Array
//O(n log n), O(n log n)
    func beautifulArray(_ n: Int) -> [Int] {
        var dict = [Int: [Int]]()
        
        func dfs(_ n: Int) -> [Int] {
            if dict[n] != nil {return dict[n]!}
            
            var ans = (0..<n).map{_ in 0}
            if n == 1 {
                ans[0] = 1
            } else {
                var t = 0
                for x in dfs((n+1)/2) {
                    ans[t] = 2*x-1
                    t+=1
                }
                for x in dfs((n/2)) {
                    ans[t] = 2*x
                    t+=1
                }
            }
            dict[n] = ans
            return ans
        }
        return dfs(n)
    }